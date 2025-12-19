Return-Path: <linux-watchdog+bounces-4724-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5BCD1D05
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 21:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A4973067D29
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Dec 2025 20:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81D42EB5CD;
	Fri, 19 Dec 2025 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAbPsiwL"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A542EB862
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766176976; cv=none; b=PNO1cld3rcKPQL3/PY4fvqjElO56Z+TheYBZE24+o7vHfeX5AI0lI1pqoNOxgCYeiZHApvU+rQTvCwiWsXUfI9HBde93GP0mZLR17SVag5TWbT0K+9PIJ8SoeZFnvL+5GLTQhSRwyk5S532Nlz3RNf6zlAPf98vblExnZA1sOqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766176976; c=relaxed/simple;
	bh=vTjbz2xExaZcXaw1+mkLdNF+efUVXmDz+X4wv9kkqgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BivuaFcd0Cz8we5qktfGFWyrdGJxvpqKHccNtCWoxXwb8O3fOwL8fmzWFZJDr2xvfqDz1Xe6mG3j+8qN2jck77ciX6ZR86iBJVVCkHQPxz5OudI3XYANy6/sCWAzhQMmzr7YHPSCnpGz9qnoyLZfU58rJDYcL4tU5iXEoQ10nAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAbPsiwL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5957d7e0bf3so2705078e87.0
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Dec 2025 12:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766176973; x=1766781773; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=en6xvapY2fXeBfC2thntt566iYBzoKRkgHyWoO2aSq4=;
        b=BAbPsiwLPADpAqFu7pl4OyaEl9DRn2f/PKJ9qILK5v6L7Y7o7Is/jwUQPTz8mRlBuj
         vgwEUri6f5aKKyE/sSM/K8HJWedTYVCWB9E0qsTDYxKT8XGIQGOdGwbULENZ6HLzwTG5
         oja39qVwyg9/fGawweoXD91blyJpFf9xswZZ+EotXOTsx/0Ce+CP8O/Zoig9KoR871+c
         qMOB4Yyb6IGxIXpY4weFlATSRt1qEvHxeSL08wmKG2elMec5g0RWiFBHQJ4awL9dcyAV
         hXEQjTtxP4tiIrKnEkvfp6uyA/C44NTvwWNmMNDl3FVVSRtSuqIl0QtRNHYp6lj7RoYT
         6Haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766176973; x=1766781773;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en6xvapY2fXeBfC2thntt566iYBzoKRkgHyWoO2aSq4=;
        b=BuLA0gPb0m7uVwfFMmi8+y/jT7mj7jGXjIfClapOWEHvnqxHPwgMWEwec2y2tcT8iH
         kSi1PkfqU+CPe84A3qeFh7tR/Z7XIS3sTgRJxM7wWTRtL8fL685me4ngple/c+rIQ+0u
         uHf/kx+dCgh4G4R6osY2lSodtkSo6S+w9f5NXCd9ykDnDjV0rXgga5IU/HtnHeBQAjH0
         ImRJ4aROcurw7L9t+FPomKvwxDDHOLcDZxrOWw+PMS8VbTCjOrMHcFYVCnqQMsr8zgbm
         PXB7Kb9RQB6QPcKd2dOkTd/j+tRn7QSBagbboqgMUOMCDJk0ENJGCXwDtSe3hQjhCbJi
         5KfA==
X-Gm-Message-State: AOJu0YyOV9AIyroNa1mNWC8sCLZK3Ka2MLwZF86iU6DfbUwvLzaP0Zo3
	iUapDtEqGfcRlJDD/dpt9rf2S+wF6nOaPcgQAT/V/9gUzY6UX7bErXbh
X-Gm-Gg: AY/fxX678l+lwcNV/3xqrlFvcSQdkGetNbtL4K/qhu3BFTiQ5GH7gaULeKmDRxJbpR5
	V7VMUX32JGDU/L1k+9cdFO2KM/8gdiR6lcgSqGZVj6ktFOUAh31cMjKN2RhXMWc3Sxu6gBEkjZJ
	PEk7WKik5/jzROj6cThzEBAPCC3NRsF5nLDSRds0C5uKJHHFlr4TuGPIDm15baoX6g78uZx4TRA
	pEkT3G1heaxbXvZ0ss7MCUtVzad/ti4G/hXdafkXFiJWGdYgPpR34pq5uYkACtq5RTmnTowwm4z
	O6OsW15p99KIRI0nHglrWksEY0y2qLZ2H3WL7kXnuCy9lLTZDq9sRi3alMyLQzut0yiXJGA2I/m
	A9t23P9cNQd7inZGPs+h/IXL8TA+289hjZTVfsNj78EJJuidbw612ck/3KPC0uoscRPAn9F/Dnq
	046Sy64ZMoqCtdQvz76+ifCsAvfvaSuzCZ2rz8LlUtWtzEUM8qxuhGZFtR81QFjcxbYSmMJy+FP
	9hE2w==
X-Google-Smtp-Source: AGHT+IFzwpgzTN4hBZG4gSXH4+VcAksaplIJ1PAIf7gkxFw0pR9MDQcDDYZX3n4Zbrpr36Dginq5ow==
X-Received: by 2002:a05:651c:2205:b0:37e:508f:81d4 with SMTP id 38308e7fff4ca-3812081e778mr12955881fa.10.1766176972870;
        Fri, 19 Dec 2025 12:42:52 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (37-33-132-227.bb.dnainternet.fi. [37.33.132.227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251affbsm7727511fa.17.2025.12.19.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 12:42:52 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 22:42:38 +0200
Subject: [PATCH] watchdog: Make API functions const correct
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-watchdog-improvements-v1-1-9711c519474a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL24RWkC/x3MTQqAIBBA4avErBMa+6G6SrQwm2wWaahUEN49a
 fkt3nshkGcKMBYveLo4sLMZWBagd2UNCV6zQVayRYmDuFXU++qM4OP07qKDbAxCyQ6behl0jwS
 5PT1t/PzfaU7pA2+dZ2pnAAAA
X-Change-ID: 20251219-watchdog-improvements-a26143b9c81e
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kari Argillander <kari.argillander@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766176970; l=4481;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=vTjbz2xExaZcXaw1+mkLdNF+efUVXmDz+X4wv9kkqgY=;
 b=ETbI5Q1EuZXzibeKxX5ix/gBoOYvT7sw6ae/rIyloc3+rC622Pm/Xz9vzFPW8/f2J+MDO6xcN
 ZiVyIT5Zd80Aw+Ikpj87f8LYcyJhNjKcFwFKtu6TVGWOr1txi/Q5Vun
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Many watchdog API functions do not modify the watchdog_device nor
device. Mark their arguments as const to reflect this and improve
const-correctness of the API.

No functional change intended.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 Documentation/watchdog/watchdog-kernel-api.rst |  2 +-
 drivers/watchdog/watchdog_core.c               |  3 ++-
 include/linux/watchdog.h                       | 12 +++++++-----
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
index 243231fe4c0a..5649c54cf6fb 100644
--- a/Documentation/watchdog/watchdog-kernel-api.rst
+++ b/Documentation/watchdog/watchdog-kernel-api.rst
@@ -293,7 +293,7 @@ To initialize the timeout field, the following function can be used::
 
   extern int watchdog_init_timeout(struct watchdog_device *wdd,
                                    unsigned int timeout_parm,
-                                   struct device *dev);
+                                   const struct device *dev);
 
 The watchdog_init_timeout function allows you to initialize the timeout field
 using the module timeout parameter or by retrieving the timeout-sec property from
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 6152dba4b52c..8300520688d0 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -117,7 +117,8 @@ static void watchdog_check_min_max_timeout(struct watchdog_device *wdd)
  * bounds.
  */
 int watchdog_init_timeout(struct watchdog_device *wdd,
-				unsigned int timeout_parm, struct device *dev)
+			  unsigned int timeout_parm,
+			  const struct device *dev)
 {
 	const char *dev_str = wdd->parent ? dev_name(wdd->parent) :
 			      (const char *)wdd->info->identity;
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index 8c60687a3e55..62cdd26fd025 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -129,7 +129,7 @@ struct watchdog_device {
 #define WATCHDOG_NOWAYOUT_INIT_STATUS	(WATCHDOG_NOWAYOUT << WDOG_NO_WAY_OUT)
 
 /* Use the following function to check whether or not the watchdog is active */
-static inline bool watchdog_active(struct watchdog_device *wdd)
+static inline bool watchdog_active(const struct watchdog_device *wdd)
 {
 	return test_bit(WDOG_ACTIVE, &wdd->status);
 }
@@ -138,7 +138,7 @@ static inline bool watchdog_active(struct watchdog_device *wdd)
  * Use the following function to check whether or not the hardware watchdog
  * is running
  */
-static inline bool watchdog_hw_running(struct watchdog_device *wdd)
+static inline bool watchdog_hw_running(const struct watchdog_device *wdd)
 {
 	return test_bit(WDOG_HW_RUNNING, &wdd->status);
 }
@@ -169,7 +169,8 @@ static inline void watchdog_stop_ping_on_suspend(struct watchdog_device *wdd)
 }
 
 /* Use the following function to check if a timeout value is invalid */
-static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigned int t)
+static inline bool watchdog_timeout_invalid(const struct watchdog_device *wdd,
+					    unsigned int t)
 {
 	/*
 	 * The timeout is invalid if
@@ -188,7 +189,7 @@ static inline bool watchdog_timeout_invalid(struct watchdog_device *wdd, unsigne
 }
 
 /* Use the following function to check if a pretimeout value is invalid */
-static inline bool watchdog_pretimeout_invalid(struct watchdog_device *wdd,
+static inline bool watchdog_pretimeout_invalid(const struct watchdog_device *wdd,
 					       unsigned int t)
 {
 	return t && wdd->timeout && t >= wdd->timeout;
@@ -218,7 +219,8 @@ static inline void watchdog_notify_pretimeout(struct watchdog_device *wdd)
 /* drivers/watchdog/watchdog_core.c */
 void watchdog_set_restart_priority(struct watchdog_device *wdd, int priority);
 extern int watchdog_init_timeout(struct watchdog_device *wdd,
-				  unsigned int timeout_parm, struct device *dev);
+				 unsigned int timeout_parm,
+				 const struct device *dev);
 extern int watchdog_register_device(struct watchdog_device *);
 extern void watchdog_unregister_device(struct watchdog_device *);
 int watchdog_dev_suspend(struct watchdog_device *wdd);

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251219-watchdog-improvements-a26143b9c81e

Best regards,
-- 
Kari Argillander <kari.argillander@gmail.com>


