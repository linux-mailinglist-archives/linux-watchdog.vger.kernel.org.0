Return-Path: <linux-watchdog+bounces-3999-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D759DB29396
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 16:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15593205F41
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 14:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2041F29CE6;
	Sun, 17 Aug 2025 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CacjOo/F"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA038DEC
	for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442107; cv=none; b=bA+xsrUF5wl1UoKvCazeDagIUuTF9vB+MGdu5gRT1ZlGl/QlvD6vtk8LxAqWD8s9lRsbLcZkkfA9y1tIXaMTwkliBQu9qvwxPFBtiHWonGg8f8iYOZkOu+i0XEdvbn+b8Kan6aDn4rUgjNoqD3gQZr5FgcD47GRoflfKolQqRks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442107; c=relaxed/simple;
	bh=YfP01C1j6YvIynRZr0OBvEqt9YLQolhlhrMgEuoeA9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e5tNoHu75nQTAQrdqennfzKgJurbMUaRQBevu+8Dznan1Va0tZJ2nssO7bshDBw6ZLbJbsA6oOh0WSCIxWhMw+sgnxPIVgjo9BNttJowBUTxmiXPS+0F1UAqmUZntjfpSSWw780jgrg/WoparIrqk791TIDWx2+QWT24qPVucVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CacjOo/F; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47052620a6so3479875a12.1
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 07:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442104; x=1756046904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AFww3TD0DV6xBkSrDIAc5oWQQBscq4IlQK7zrXJUccc=;
        b=CacjOo/FNiYGrr2VKiZvG3BnHZVO0RZPcprqSf1eMvTcCKVjqFiLcnAd7vCqzBsv7U
         m9H+/75ev+lkunKqmMoC1XBBFdJb5t7xEE44/Gr9+R8X0yjcmbVzSHx9ZDI0cN2PrEWY
         n4J0UaKsDPbSZ4HMrVDIPub30l8OfWzaSPJQlZkX+TusaCvong6bIwyBfzkSTn+LvJrH
         yUg1TTHoV9LD4dXESw6q5YND4vjsPon2Wxl753ulyEAdx2u52QL+C6BZNLRim+y6vOaz
         yGJiCtUcvjYXqqycRvpJc30Ump7LVCamVDC6tIq0MDxSmi+CuYtfKTCwy6Ad44NDQXlX
         PYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442104; x=1756046904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFww3TD0DV6xBkSrDIAc5oWQQBscq4IlQK7zrXJUccc=;
        b=YPXBMvsxOnrXDaHFDR0hEHB2JD716Nx0mJjW3VBFkLfg5IggRwF1UwANI4GaVHswf2
         yfAJE1SdgyZ8ZhCYekORzVjFTHxHDCnpSiKHBMCCWvKJWebamhj44so1jWDd11jvZrU3
         P01K6t9TBe7I0exLBXq236at5AnO9z7FpGzdr+ogdhiRFSn75KUwSbw7PuDw6meCJkr3
         9SHHQwhiTipa38AplvkumOmSERJywLXCLMRaYr0/5TUdi+Z4XzdbEQbNn/FLEPtzEQ72
         DJCb2K23w37p1nIj/0udvgvXQqYpVBrc6WOg1eAerSiSssUyGtquDhEamXccO9kVVPFf
         AGCQ==
X-Gm-Message-State: AOJu0Yz+OaWYTTqkfu+fJn9b5Prr4iSMx9hCdSq8r7Sb1vfMmrk8eTlA
	DKg5gvY/4ej3J5kqv6/4qzjALGKNgbR98DKOwie/OkuwLdVOXycM8HywEl8EIw==
X-Gm-Gg: ASbGncuGbTKDcq/3jGDyNkEnaaoG0lz7DH9iOuC+kKh+pOucOAXDNM1SJS8sQ1JgLO+
	GeoWlREeDiAAs00p8MqN4z2EyCfpHITmugCnmQDJgJwquMDhJW2cbrogZ6oKhbDMT864v94JXdz
	GhLaTzEkWnCHW3qBuV7+iSMYkxB9hFZudyTZL6Kutrl/0ffOjD7Kngrr5crZrjUoSsFK93euMTz
	vaS4ZqrBRqsb0JiYMu45rWdA3DoKwX2iwdeS2hbLlfR8OHm64S8zU/uahiKcHG5D1qUn5MJeh9j
	fvUhpy50Q4VvUtyTIUIvofbMntjqdCBj2XUkQR66s6kiXsJrOS0bBYDGOcgAJqXaEGHQXwoWo0E
	ns+CaAeLSApZvtHTq2n2zxeitmXX+6O0p1YBUL0snDPxM0g==
X-Google-Smtp-Source: AGHT+IEKzMTsSikxSwneGudUhfXJ5O4BKMyzYRZw7/ndCST6ZPW7Sp3O28oGONHe+dxL6MrFTY7mzA==
X-Received: by 2002:a17:903:2d2:b0:23f:75d1:3691 with SMTP id d9443c01a7336-2446bdafa24mr129920325ad.15.1755442104037;
        Sun, 17 Aug 2025 07:48:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0a5cfsm57127995ad.64.2025.08.17.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:48:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Petar=20Kuli=C4=87?= <cooleech@gmail.com>,
	Diogo Ivo <diogo.ivo@siemens.com>
Subject: [PATCH] watchdog: intel_oc_wdt: Do not try to write into const memory
Date: Sun, 17 Aug 2025 07:48:17 -0700
Message-ID: <20250817144817.1451377-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The code tries to update the intel_oc_wdt_info data structure if the
watchdog is locked. That data structure is marked as const and can not
be written into. Copy it into struct intel_oc_wdt and modify it there
to fix the problem.

Reported-by: Petar Kulić <cooleech@gmail.com>
Cc: Diogo Ivo <diogo.ivo@siemens.com>
Fixes: 535d1784d8a9 ("watchdog: Add driver for Intel OC WDT")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
I don't know if this fixes the reported problem, so no Closes:
tag, but the code is wrong either way and needs to be fixed.

 drivers/watchdog/intel_oc_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/intel_oc_wdt.c b/drivers/watchdog/intel_oc_wdt.c
index 7c0551106981..a39892c10770 100644
--- a/drivers/watchdog/intel_oc_wdt.c
+++ b/drivers/watchdog/intel_oc_wdt.c
@@ -41,6 +41,7 @@
 struct intel_oc_wdt {
 	struct watchdog_device wdd;
 	struct resource *ctrl_res;
+	struct watchdog_info info;
 	bool locked;
 };
 
@@ -115,7 +116,6 @@ static const struct watchdog_ops intel_oc_wdt_ops = {
 
 static int intel_oc_wdt_setup(struct intel_oc_wdt *oc_wdt)
 {
-	struct watchdog_info *info;
 	unsigned long val;
 
 	val = inl(INTEL_OC_WDT_CTRL_REG(oc_wdt));
@@ -134,7 +134,6 @@ static int intel_oc_wdt_setup(struct intel_oc_wdt *oc_wdt)
 		set_bit(WDOG_HW_RUNNING, &oc_wdt->wdd.status);
 
 		if (oc_wdt->locked) {
-			info = (struct watchdog_info *)&intel_oc_wdt_info;
 			/*
 			 * Set nowayout unconditionally as we cannot stop
 			 * the watchdog.
@@ -145,7 +144,7 @@ static int intel_oc_wdt_setup(struct intel_oc_wdt *oc_wdt)
 			 * and inform the core we can't change it.
 			 */
 			oc_wdt->wdd.timeout = (val & INTEL_OC_WDT_TOV) + 1;
-			info->options &= ~WDIOF_SETTIMEOUT;
+			oc_wdt->info.options &= ~WDIOF_SETTIMEOUT;
 
 			dev_info(oc_wdt->wdd.parent,
 				 "Register access locked, heartbeat fixed at: %u s\n",
@@ -193,7 +192,8 @@ static int intel_oc_wdt_probe(struct platform_device *pdev)
 	wdd->min_timeout = INTEL_OC_WDT_MIN_TOV;
 	wdd->max_timeout = INTEL_OC_WDT_MAX_TOV;
 	wdd->timeout = INTEL_OC_WDT_DEF_TOV;
-	wdd->info = &intel_oc_wdt_info;
+	oc_wdt->info = intel_oc_wdt_info;
+	wdd->info = &oc_wdt->info;
 	wdd->ops = &intel_oc_wdt_ops;
 	wdd->parent = dev;
 
-- 
2.45.2


