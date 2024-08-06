Return-Path: <linux-watchdog+bounces-1461-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9DA949701
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 19:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58270281EDF
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 17:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05EE922066;
	Tue,  6 Aug 2024 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hf5eF/Uw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC114D8A7;
	Tue,  6 Aug 2024 17:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966057; cv=none; b=o3juzrosxMO+VQzx5xzFbTYu9lslE8apysN8QoYT0rOzJZvbZoDW8S4TDuFgrEl8De/InGFWCo1CNxPNiLy7DygLA9U8h2dqVBnIgopNN0Y1fESZNSOBZfmDncV+xRxLHdVIQ69qcck/GfjJztuwmhA45IG+11w9V3PaF/zKA6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966057; c=relaxed/simple;
	bh=fkbPWXIin5GVN5zqd3mb1VYuPlgT+bAkm6EHPoVEVtk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qk1cmnLK3lieHJi6Q6bUBLy8jeKN8GMCQ4i7zdjyaydGx75q+yDO5YKeZF9qGFkEr424N+SLIHZnC90GHa3ipMgHClsmM6tV3CYoJyBfGuWu9W72ttZ8K2A79bj9ISiUwIvyVF06kF3tNpsZLStTRyjKOqUl97s5lPMulrmySdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hf5eF/Uw; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-492a8333cb1so333988137.3;
        Tue, 06 Aug 2024 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722966055; x=1723570855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lt7V8VDXwEd2O0VvPjYetnRBMqmOEMEk2w054gpQkv4=;
        b=Hf5eF/UwUBsNJyZaTAIboXF1d3AY9zbc7RZD3fYbTUUnaMcx+YBq/XYE9O+50aX9yJ
         3yHAI7D5ZJSP8R0rR4CQsHIDSV7Hw+aRETUOejMfwuq/ss/xqBh6XGHC8A1lMEflNlZ2
         oCMErnKWK3e/yHZxyAd+vDHMD+eLPOJ6Jenf4D7htu58QtSB7K1sWKmKi2b8ozNljNMq
         lhTX+2XM5x2LYJDYOLx9diLc7UbFmhV7P86AxXh/HACOvHndJ1VoA8jCtvXK2sTdOb4T
         bESEaxHI84v3Nc6bSGaobAd7+LViXg4P7UjSNChYwtcRZvcBBKMw16WvwJHJ67Ng6If1
         CqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722966055; x=1723570855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lt7V8VDXwEd2O0VvPjYetnRBMqmOEMEk2w054gpQkv4=;
        b=VqXR9oNxNo9PhGcy6GLg3DLKlumv2jf5wjKLeXXzOf2NhVlRiCrjNB56JzEsCurfOu
         7jZqO/BtSsn+9M57s1vpQQBvC7Ho6oGr9zJuf8ZQALjZDKh/pz7xVbu0Tu+/pA4JeRau
         6oFPxwIFQDSyLB/Ju+1FyrX7VgHMM61+xZq0m/KIDNP1kFLDGOeIPfO/E/mcEQDgAzV0
         1c3CMTQ4GDrqKFnEt6AE86FAl2a2VRmaGK52uaTsYX+LNwqjka/yJ5xVkIzLrBaLQiCO
         b2LnFei0cbS9bAD8ELafO75BnqViiIdDF+hUO6YvD/AE7gaVV4vKbPm75b/5QBL1GDmN
         o6Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWX8sBKY5MMHZ0wP6/R+5fe/uMIymqzlgvR7deoZLO3ICgYmNK1ofpnT3D1eWTeAmCQmGT7VAdevVOpqayjU+y0b3g1snU7hnqXR9j86zmY4rXuIhvvnb1O/9Gv3Xcu6bTuE/SRijVzpK+niRz+9RFLcMhDNKUMKGjkZ4ul2d61SuRaHwimgcw=
X-Gm-Message-State: AOJu0YyN34vJtsYn6pQdvL2MYWLViA+dC1Yh4WFJV6oeuzTp9aoklSd6
	IofV+QU8dONqugLlDvegLZRzJ/nRSTqALY1Jd4JtttEkAybiIu0b
X-Google-Smtp-Source: AGHT+IGGGfWC0Kl+X8jwgND0ATPm/XNrwha6G4p+8ZrlGmW2CQdJkS3etYUjZi1JdhmLArc6oFvwKg==
X-Received: by 2002:a05:6102:26c6:b0:492:aa32:81c4 with SMTP id ada2fe7eead31-4945bde2973mr17579307137.7.1722966055362;
        Tue, 06 Aug 2024 10:40:55 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4945daf0171sm1727276137.9.2024.08.06.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 10:40:55 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: David Hunter <david.hunter.linux@gmail.com>,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] Capitalize Fahrenheit
Date: Tue,  6 Aug 2024 13:40:38 -0400
Message-Id: <20240806174038.708025-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Captialize "fahrenheit," a spelling mistake.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 Documentation/watchdog/watchdog-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 800dcd7586f2..78e228c272cf 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
 support the GETBOOTSTATUS call.
 
 Some drivers can measure the temperature using the GETTEMP ioctl.  The
-returned value is the temperature in degrees fahrenheit::
+returned value is the temperature in degrees Fahrenheit::
 
     int temperature;
     ioctl(fd, WDIOC_GETTEMP, &temperature);
-- 
2.34.1


