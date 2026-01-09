Return-Path: <linux-watchdog+bounces-4778-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB169D0B5D7
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 17:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28F44303DD13
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 16:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9DA364E98;
	Fri,  9 Jan 2026 16:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMwgCUrI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="uMwjU8C+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E92765E2
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 16:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976955; cv=none; b=GpUteI5r3CnrEx8rGsX/+c1K5L6lBo3WFsQycz4zEj1y+b2pE+qAsyKPrnzO78j8qu2OC/+hcIKSrsbbimcQifwDPlsjv2N1kO3bENG6hYja1RM8qzojJ8+IZT7sb8lNJqoEuMReGQMgS9QaO6X/mGfiPskNLZIyon+FIif55ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976955; c=relaxed/simple;
	bh=DRbOK5RwsYU6XFWfVMOEiIAoh+ZHNz8ulaOIBWnK4J8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EeoFblvtaZDQEgO1znHOGwAN3ltS3TlFkY95/BCIlU1oKS9qjGVT6qvGSeLJrrmV3MWyuPGK/ragCb7JFVJ9Wb+Ada65mzJ1Mj8yFvmRQsWGxi94OlH29o5DGok6Xd6vPzxvnM/ggD0Izqj+nxdtwlUtKGmiF+xW26ebwoymTV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMwgCUrI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=uMwjU8C+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
	b=UMwgCUrICEp0kwmnnbMRIXeNxCeNy6R/KhmoFgn8svIADDWcnLmIh7wSsdg1QiZzmf91H8
	B6wr1VKFwknu+rW6EAFGeK1UWzTXjrfzWyqiTr9BzK5lywCGqFqBSl7NgRzpgXmeukpyHt
	aOkQgM2BblzhK+clJhaBDjhiC/ZyMkg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-suNkL5dwMCKG4rLFPNxjiw-1; Fri, 09 Jan 2026 11:42:28 -0500
X-MC-Unique: suNkL5dwMCKG4rLFPNxjiw-1
X-Mimecast-MFC-AGG-ID: suNkL5dwMCKG4rLFPNxjiw_1767976948
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f59bf206dso4702344241.0
        for <linux-watchdog@vger.kernel.org>; Fri, 09 Jan 2026 08:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976948; x=1768581748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
        b=uMwjU8C+16BPh4N1VLTS9eN2xV60i3dxADDjtm6M2+WKXsGi4gmCDXBQ3wZLohXkHY
         Xg58aM8k30lEfIf2ybDkFldy0LVvBzRNPu1LJVCldDYcFABnZU+LpkKve3Wl0e6UQiwl
         OnKaUrApwKM4Quse1D2sJ/iD4UeoSXARAqNcTB27Wv3jRRFG0ZjAjnWn+IpZCS994PeG
         1Q6hbQXf4Vl7/0f+N3U4+AmTJD1B4DdiIPSoz+WZXe6D/AohzgoV6pp8590tH2j2UXbt
         TuwIhmWs3dRPNjBSVmoUjFchVMoMQC68UNn4OnZ6ad9EhDQepgaXQNL+7PIPvGp5kYu0
         iYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976948; x=1768581748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+5x7D+IP18D3heNoU5HsOr8RG106ujJD8y+92pAU9sY=;
        b=DkXLyORzes9CibNKtwi8hEVxztgjdgKbaukKpgT8WnnAPwWBXSo3J0LvI8A3XTtomS
         vCx0r8LLzR/MTqdleMFJxlHh7eyvwwTKmWw7h7DGzoiRgGk+ajCeBzeqasl0/sPs5OL3
         TJZ6nGj4+75lpTV8s5dWfiFkT7Mv2aqYdiCIqGN6ubcckPeF1ihqfJUHrySPQbpprncj
         TmRFacQqwRpifO9RZH8nOPB3UTeoV2z8909bN+i6Yv9TiCX24XCZRDo5nP47IKXdFoPj
         dJjplF4E0o9wMi+fdJTwqKos6DMdR0Wi8FRcgImCuecFldi90JybupPvDSNQzpKjQYwT
         EF9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZN9dI8ud8rx0TK4zjornxT90E/Hid4sEn+gvAmbhV42bnpgem5jgsqDuwWYnZCqb2faYQGuFQBtC9a2Rc8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMRbWmS69GoIjyDor3W6/cL6DQkghfFJQAmEQjEVgVlO2ktrVr
	lyOvOCT+BXI2w0RChSSbxPxZ6mcXSVmFzLaIyI545NFhtrBDyULK/Y+HNUfBLKC0CyKbOs/b60g
	zhlv4wcP1TYIkq22PwqGTK87sWpzgy0J6rNaJnMFNgv8berfcEZsZfh2Djrc3agWaXVht
X-Gm-Gg: AY/fxX7GTbHvuTyzB5LjoNw9Yj8vs19cZ4sgm4l4bq5MbB1tToLx29leDBf04cVCEAt
	VzmWuhQK0P8f/i7tThSXKyMjJPwIfToStCrh22MQau+5aFrRPZcE+1QKbVR4O0wau0aNEoOzKZS
	zW2UXKGV3vILkORNcEmWiiCOqFwJf3QklU4sI5y/Ab65MyM4V7zeKux6BkgWM+Uv0McyTktiF0P
	lDCr755aC8zBZRiQ/bqrXrY1qmDPk5jh+FfS4eNIsv83sWhexm6WJxuFr+GPDQme0oEpXxZTJ1r
	aFfsQF+Trir890+fACKcqcfGO1N7le45AQSffSb0e6rph04F+IibAkY744M0n9iSiy/JPM/uQ98
	oP8gbsoPF5zNi8nhqphWPyGnodQf+tTkTdb/1E50kU4n63ze5
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id 71dfb90a1353d-56347ffba03mr3750455e0c.21.1767976947725;
        Fri, 09 Jan 2026 08:42:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVEDN+tqrnIiLABY/j988WSa2acdIYRDjShsirXH/cCw81AeqGpIol7AsEzjoFpyT0Ef8DGw==
X-Received: by 2002:a05:6122:221d:b0:563:4416:a0aa with SMTP id 71dfb90a1353d-56347ffba03mr3750447e0c.21.1767976947337;
        Fri, 09 Jan 2026 08:42:27 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:26 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:23 -0500
Subject: [PATCH 10/13] watchdog: pic32-dmt: update include to use pic32.h
 from platform_data
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-10-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=DRbOK5RwsYU6XFWfVMOEiIAoh+ZHNz8ulaOIBWnK4J8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y+2zXNcVTUzg+3666TtbEcXHJXX3XQxW3T6vfstE
 a9vRxXM6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiM/4w/NNQdL82c8kJX4H9
 K/JabnCZcCw3kJdrmFM1qaUnJcDy8g6G/0Vr31n/55PV4mT4YpK1k03/fZDpu+9dH2+sTGhconr
 8MQcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/watchdog/pic32-dmt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/watchdog/pic32-dmt.c b/drivers/watchdog/pic32-dmt.c
index ab0682492c85ad63160bb7da61cc74336698a4e9..12e3a8f63589862e3ed674ffb71ee4798755e56f 100644
--- a/drivers/watchdog/pic32-dmt.c
+++ b/drivers/watchdog/pic32-dmt.c
@@ -12,12 +12,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/platform_data/pic32.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/watchdog.h>
 
-#include <asm/mach-pic32/pic32.h>
-
 /* Deadman Timer Regs */
 #define DMTCON_REG	0x00
 #define DMTPRECLR_REG	0x10

-- 
2.52.0


