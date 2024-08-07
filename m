Return-Path: <linux-watchdog+bounces-1467-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB16A94B00E
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Aug 2024 20:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30ACC1C22396
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Aug 2024 18:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59C01419A1;
	Wed,  7 Aug 2024 18:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aho2UIMq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84813F43A;
	Wed,  7 Aug 2024 18:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723056822; cv=none; b=HIsmoS+QkAC3hnUZkl1Lk744ItjFHUrfU8fU1v0n123hF86BnKs5fmlx12FleOkRYvPnoKdaw+KUyCQMWUm/RO/CnO0ayBfVUE45Rpt1jcsbW2RPfASD5f0ypGm00Os1VEJToJX7qvyaDiCXd3BfFs0KzIGuJVmwG9u9P1hTT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723056822; c=relaxed/simple;
	bh=e9IyYXy2oprSPFD8Ke8Dj7pvrFwX8/hQdl3qzz158Oo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kL4U0sG4QAkIRWHYFFYmnxF/KPg/VtTK7pyREWTMCwPwY90rBKCHd6o2QmHTtzalfWD1Ja5OMENR8NpchZNhuIsn17DehDA9znaitn/GerP6EWfW8Q/3JvMCe/Qmk+u5y23Kp62DmV07Eyo0W1K8kenT+orb8R8SwXuYVfY1l6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aho2UIMq; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-48ffdfae096so35429137.0;
        Wed, 07 Aug 2024 11:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723056820; x=1723661620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrxfRKvkVDz5Xf+hzvJmQ6Nw1sDrNkZo7rKJhKh6E44=;
        b=aho2UIMqPXo44dduWn8il/BWR9O8ch8IZ8cy1mp0c2y7aL4sd2avs+h/fz5WQmK7le
         f04C2fDKqs8dHeSLNBXVoVzkZK8i3gmb/fBqzE94kLfGOSse3SazpWzxBYFl5YOEJu/6
         8dsBmRBt1gW1feJh0uyC9T8TBUW5zHY5aAMXqKB2/OLgclduoz9iSjwvGmuvc/2MFFUp
         RoipTPIOn34TNtGftTKnQ7QtJvBLP/50EodbGue6izVyDfPwIwIgpik89SXlWy356DXM
         2ntnQ3qwyBvMO3iHWI8C7V1eNlr+LQ8/XKyzDYbBDBppt/M5Mgc50ycJ1NrxvDxxVRfL
         TRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723056820; x=1723661620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrxfRKvkVDz5Xf+hzvJmQ6Nw1sDrNkZo7rKJhKh6E44=;
        b=m5w9Hfm4RF1DJHvEJciZPrNtS8BthAOJvPIdIp0Hs/14AAKk2hzLkWYBIHJgmpHOcM
         QPZ3+xQyLQNOuKlD54oCbNG1yyhD2TmFg0/zW61RAwXJq0YV/JB+rqV9rUOjpmh/q9hR
         58wjJDMzqjffYcZjg6BxqNA1thvkznzpmer3ypsCaZ/i4qcR/ho+OjIDswKGqzKjbgAi
         Bzn0EIbrSgEl9MVMc8yi8okHWQvdewF5UGVImOhGSGbB6/rXfoAZl6uSclqlDVPUxjVO
         D/CmW1a6KEHkAWrfiUeDjR3Wrz7Y00BFGzqk3xuetL89JvgHQywXJOXro4/giDnIZCoc
         KxWg==
X-Forwarded-Encrypted: i=1; AJvYcCVkP3FbrndDGcNAiV+Gq1OOjIhrGThc781bo4WZphW7m2hKubiqVDoCS5+mUo04Jw7y3DDk4Qg70dOqps/H@vger.kernel.org, AJvYcCW9Yi+VOGbBMQjLdXG3jZxxKPPh2uV09KkrPllSHZC6WfvyqvRKvIVWPkCLR/GGDuGXa08ZeXO+pZY=@vger.kernel.org, AJvYcCWaoOT2oRA7kn7UV0Of5eC2S8hkfJpLsUaYfXEYj+3/pmN1pj+BBkY9spD3ggQoCcCucTUmVXdn7CWQaTaejuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQWUGk1vPVrj4Thl1hUfP4dgiT1ZMUvcA8TPSViOvPIZvMiCid
	TkY8W/bjKM7OxYavQBDOvRDkUPhld3wVgx4YPKmr3hbnRxar5vro
X-Google-Smtp-Source: AGHT+IHLEQSvEuEV5aYuygNTojlWpO3dDQyyeV0soFivtuciDnfsodcfJQqmA8+V5DyV9/XZlcF5BQ==
X-Received: by 2002:a05:6102:f10:b0:48f:23b4:1d96 with SMTP id ada2fe7eead31-4945be09d61mr17260089137.16.1723056819863;
        Wed, 07 Aug 2024 11:53:39 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-83c07d00b53sm1647518241.10.2024.08.07.11.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 11:53:39 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: david.hunter.linux@gmail.com
Cc: corbet@lwn.net,
	javier.carrasco.cruz@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	skhan@linuxfoundation.org,
	wim@linux-watchdog.org
Subject: [PATCH v3] Documentation: Capitalize Fahrenheit in watchdog-api.rst
Date: Wed,  7 Aug 2024 14:53:32 -0400
Message-Id: <20240807185332.61624-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723131849.264939-1-david.hunter.linux@gmail.com>
References: <20240723131849.264939-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capitalize "fahrenheit," a spelling mistake.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
V2 -> V3:
 - Fixed misspelling of "Capitalize" in commit message. 
 - Put Tags and Kernel Subsystem in subject
 - Put changelog after commit message

V1 -> V2: 
 - Fixed imperative mood 
 - Fixed misspelling of "Fahrenheit" in Subject

V2: https://lore.kernel.org/lkml/7b7ca7e0-6bd2-45ab-bd9b-40331a8e6fdd@roeck-us.net/

V1: https://lore.kernel.org/lkml/20240723131849.264939-1-david.hunter.linux@gmail.com/

 Documentation/watchdog/watchdog-api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
---
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


