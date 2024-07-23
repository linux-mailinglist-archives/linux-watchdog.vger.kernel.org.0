Return-Path: <linux-watchdog+bounces-1419-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA493A129
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 15:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F7941C222C3
	for <lists+linux-watchdog@lfdr.de>; Tue, 23 Jul 2024 13:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6D515250C;
	Tue, 23 Jul 2024 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7dIIVeW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FBB14E2D0;
	Tue, 23 Jul 2024 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740735; cv=none; b=iDVRWVuA/EvbGQO7P5HFbduoKsBA4lvGVyr29X91iGtEORtG4JP0/R0k1yHivjegWB5lL+hQt8KRvrCJhgTAi9eLZpqsQfbAMGiJ+WYs9Fe5x7cEdaeYuR28FpBPmNivDPC6NvFpNuNicTGlg+3rapQd9AsjWFKqIFNhNnRFX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740735; c=relaxed/simple;
	bh=FXCVnslkbvUjXMTvoscIXVJqz5MQEnQ0U4ecleQBaa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eskFYX3iRDuk7P+RA/dlDTKt4pxSAhgAOw5j7yIUJ/P2nDd16gw2E4T7fAEEHWceuRpjz3CIBv9dR5G5hSGixpCUi93Z5w/Ix49kNAENQuGYM6f+Ao6TJP3/vgpqVodMnyshT/iC2bv+aBU8T+zZuAoUBSNsrnO9dIgRGPyQCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7dIIVeW; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-810177d1760so1636033241.2;
        Tue, 23 Jul 2024 06:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721740733; x=1722345533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WK24KeD1ySdvLMWAGjOGkopofHcSHfvFrGQgXSbSHvE=;
        b=m7dIIVeWJrPtCP/MLCs43JqaPMRYGWDVXPAvnEa+gdlgDxYP7z4prc70gIN5wzRk/M
         +eJGK6IMJtOgjuxHxu42hMUzEQ8DY+awjYzA5uPhkb2AIk3W9NQRNt7TuORt8B9TVyLB
         nr7YOCsF/HO5Mc2cpzcgy5z7pavfN6DDnP0/M7nqKFpiacg35JRgju/NMLFkXWGlceeF
         1/6XXaXJi8DU+gkte0Gt/FWvJB4BdDQ9oRqjB41D7k6VJdxElBZVxqawtiwWIywz806P
         yuHLp7k6TKTj+q3w0m9Wc2WYxlfN1Cr0KU+DHyhwNmhy7U7SHYSjacpo2Q74O/+gmExC
         m0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740733; x=1722345533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WK24KeD1ySdvLMWAGjOGkopofHcSHfvFrGQgXSbSHvE=;
        b=shz5idw6fTOVxAsGoyjLvVC324yg8UkzqPtkYLIfxmcm8sJq15W75klDdOcCLquz3S
         IPSRAlXcokafybtWUBzLiTZxaPH+xTj7Pc6lME8lAZXpQARc8g9dzCIhE06qwS4SPbl1
         CsPvdv/OAiZiC1yw95ijUmlxSwzQduphjHrSi2QZIuBfHMWH7OyPmOG6luPvz8hgUptj
         v9i2CdjWuc/KgQgMwC0u/0a9g/H3HcjRXtrRKeRzg2xawoJETdq/jBki1YaNeHrN6eiO
         6+4htiP2DAazT3jYriugcqg7uyZPVpYQYDIfF1OFmHB46XzsecImgcbsW0Jv0U6M+u4t
         bMuw==
X-Forwarded-Encrypted: i=1; AJvYcCUZdcMeG4x//SjaVAxeR2gBTglkSGahfNaz5fT7bMKfc9jyT2s2YvhScmbGkKIUbfRW8HNgSW5HxVOM0j+7rFihE3fzvAhXQCgilX3fBaQYzHuh4IbyE4FEoUCJ+vTxWkYx3Y9Ow8DhhgV+hwtZtIsdiMeGtA7NeFtOf9QFzMjOY4H+UBkzOWQ=
X-Gm-Message-State: AOJu0YxJuYa6Ya0OZp4UDKP1uEYqMF96XbfTpKORHDGarY7A740JkRgK
	LffKgLYDC7w+Ja65J3v6EmabBewGMqn71nt7CRMhife6DEb7Gcog
X-Google-Smtp-Source: AGHT+IGh0yf3Rbdo8yRwGnuHdTH11yr+2BstksyqIE2RcyJsdADWlTb7j6bXCE/ydkCeX8ChKx/rZg==
X-Received: by 2002:a05:6122:2011:b0:4ef:5b2c:df41 with SMTP id 71dfb90a1353d-4f693778475mr3253090e0c.9.1721740733004;
        Tue, 23 Jul 2024 06:18:53 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-4f52a32a1besm784575e0c.23.2024.07.23.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:18:52 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	corbet@lwn.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: David Hunter <david.hunter.linux@gmail.com>,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] Capitalize Farenheit
Date: Tue, 23 Jul 2024 09:18:49 -0400
Message-Id: <20240723131849.264939-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not capitalizing "fahrenheit" is an extremely minor spelling mistake.
This commit fixes that.

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


