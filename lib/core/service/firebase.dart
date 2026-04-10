import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/view/about/models/about_me_models.dart';

class FirebaseAboutMeService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload AboutMe data to Firestore
  Future<void> uploadAboutMeData() async {
    try {
      // Convert kAboutMe to JSON
      final aboutMeJson = kAboutMe.toJson();

      // Upload to Firestore
      await _firestore.collection('portfolio').doc('about_me').set(aboutMeJson);

      debugPrint('AboutMe data uploaded successfully!');
    } catch (e) {
      debugPrint('Error uploading AboutMe data: $e');
      rethrow;
    }
  }

  // Alternative: Upload with separate collections for better structure
  Future<void> uploadStructuredAboutMeData() async {
    try {
      final batch = _firestore.batch();

      // Main about me document
      final aboutMeRef = _firestore.collection('portfolio').doc('about_me');
      batch.set(aboutMeRef, {
        'fullName': kAboutMe.fullName,
        'image': kAboutMe.image,
        'title': kAboutMe.title,
        'country': kAboutMe.country,
        'city': kAboutMe.city,
        'email': kAboutMe.email,
        'phone': kAboutMe.phone,
        'cvLink': kAboutMe.cvLink,
        'summary': kAboutMe.summary,
        'summaryHighlights': kAboutMe.summaryHighlights.map((e) => e.toJson()).toList(),
        'yearsOfExperience': kAboutMe.yearsOfExperience,
        'skills': kAboutMe.skills,
        'social': kAboutMe.social.toJson(),
      });

      // Education subcollection
      for (int i = 0; i < kAboutMe.education.length; i++) {
        final eduRef = aboutMeRef.collection('education').doc('edu_$i');
        batch.set(eduRef, kAboutMe.education[i].toJson());
      }

      // Experience subcollection
      for (int i = 0; i < kAboutMe.experiences.length; i++) {
        final expRef = aboutMeRef.collection('experience').doc('exp_$i');
        batch.set(expRef, kAboutMe.experiences[i].toJson());
      }

      // Projects subcollection
      for (int i = 0; i < kAboutMe.projects.length; i++) {
        final projectRef = aboutMeRef.collection('projects').doc('project_$i');
        batch.set(projectRef, kAboutMe.projects[i].toJson());
      }

      await batch.commit();
      debugPrint('Structured AboutMe data uploaded successfully!');
    } catch (e) {
      debugPrint('Error uploading structured AboutMe data: $e');
      rethrow;
    }
  }

  // Function to retrieve AboutMe data
  Future<AboutMe> getAboutMeData() async {
    try {
      final doc = await _firestore.collection('portfolio').doc('about_me').get();

      if (doc.exists) {
        // Get data from subcollections
        final educationSnapshot = await _firestore
            .collection('portfolio/about_me/education')
            .get();

        final experiencesSnapshot = await _firestore
            .collection('portfolio/about_me/experience')
            .get();

        final projectsSnapshot = await _firestore
            .collection('portfolio/about_me/projects')
            .get();

        // Convert to lists
        final educationList = educationSnapshot.docs
            .map((doc) => Education.fromJson(doc.data()))
            .toList();

        final experiencesList = experiencesSnapshot.docs
            .map((doc) => ExperienceModels.fromJson(doc.data()))
            .toList();

        final projectsList = projectsSnapshot.docs
            .map((doc) => ProjectModels.fromJson(doc.data()))
            .toList();

        // Combine main data with subcollection data
        final mainData = doc.data()!;
        final combinedData = {
          ...mainData,
          'education': educationList.map((e) => e.toJson()).toList(),
          'experiences': experiencesList.map((e) => e.toJson()).toList(),
          'projects': projectsList.map((e) => e.toJson()).toList(),
        };

        return AboutMe.fromJson(combinedData);
        // return kAboutMe;
      }
      return kAboutMe;
    } catch (e) {
      debugPrint('Error retrieving AboutMe data: $e');
      return kAboutMe;
    }
  }
}
