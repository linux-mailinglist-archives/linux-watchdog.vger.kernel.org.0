Return-Path: <linux-watchdog+bounces-4013-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACAB2B751
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 04:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 507C61B66593
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 02:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1AC1B4F08;
	Tue, 19 Aug 2025 02:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBy40dAY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DE1401B;
	Tue, 19 Aug 2025 02:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755571953; cv=none; b=rAs+eMng0lOhgQrhx8A/FrlWHV4SM2teIrRsQ2fdaMPFJ3oGBq4DIRVH/G6nT1qCDnLU6f0Zc0dPIn0vrFaEw2h7CaG13drd0YFcTKKrng1+iHAym6MRYmDByGI6A50YlKQ8QEv/vZIgTJpO46ox0KiCam6RK+KQ7SJPlz+noXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755571953; c=relaxed/simple;
	bh=Y8x0Dz67DsKdjkPQ4PqlBubQxlf28YguajRC+ZrW2pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR/Jt5OIZOl49lwBtmgsGoEhFdbf3B/X15cbsX0OTTkfB2MQhRmBgcS7BY6drLFsoCMllwNJPZkdqiTUkGKsHkx9pPPQTyhdAn6J/gubfJNLZrNdH9WAMNnMJyB1vfUWV0oAtRhHGuAo+y1bySMqQj+ayidI91fwn3IT0s1ZgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBy40dAY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-323267b7dfcso4460152a91.1;
        Mon, 18 Aug 2025 19:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755571951; x=1756176751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkCzBsvlP6/Ffz6cOOw96jrDeHTlV8A8u/fp/nqqvhc=;
        b=YBy40dAYL5AGJlXpHM4sHkqfMf7vcNODjNbxbcNwUrd3IfT/XVMvvUvHBx2oP6CVOf
         /o7iGF8rhRDYZ2+UL04MqAFVNd3U8F3Vekx1hxPJVxBaAWRjBj7xm1g3AhZQqBIncq4o
         eJs09+PSz61HnYl3snOrwv8xF9qiQr9+N+WR6H0DBzxaby/TiHoQmTbU5RSYqkgbO+Qp
         z2RJjYIW40JUXITLwArlhGkOxkdyuIZcusVj8c2b2NtQdtmlL0P+pMlNfOwZ3uU696pn
         YVsiOVs3+h/VO3NCorWohMfDsUBcQ9xYGskEWPfRpZZujow906Zny9WtQL9KCNvtMewR
         nffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755571951; x=1756176751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkCzBsvlP6/Ffz6cOOw96jrDeHTlV8A8u/fp/nqqvhc=;
        b=X+XxPhPwyiJo7PzbcXpjO+2cdIDgkinE3uLXgatXnReM7VWGG0ft1E/tEHSxPuSbLh
         cwZoREhqBaxTJzQ3XeAb36C1n0kJ++peA1XF2FWSuEhlQjfZG+kuDc+2SpY5SSoAIrGe
         SQVcBpyGOsi80/AUscZgGU3oy1FSHxpRJ25Vw/eJXi78n1PY7Wpnr9rnkbjbEkoig1Eo
         go/oqPCKJr/LP0IzdyLp9NODuHFYNeXpyNicki4jYP70FVGdLu+Jq9ScBRDg14jwKsYH
         ac0hwGlllzjlJSVczFdadwIZxyugfmqXPmkvsgNUJigB/cpjaSH3aRBF5C4wSMu102Gc
         cmwg==
X-Forwarded-Encrypted: i=1; AJvYcCXDVX40sWfYkNDWoS/QZ/4/EsU3mvNJ3h8fXqYfv4VkftH6pSg/SQg/EsFNNoAwlgGkc5TpmMgVqOE=@vger.kernel.org, AJvYcCXOs94FKJx9vfUbbHe8HAx4/5OnZdOlaQCDloW/PHPMSAusz1gW3oNIA/yXmGpWsiISIikJP9cmaL22A4Z8RW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUOzxZi5ImUCE6BSnljKx8X6oiN+dHhlgbchyxOmyD0QvU6s6
	C3rgZbKmNnpp4seoHw7Sl6mRSuSWLCFF1jHhK1sl9aT6WlFHMkU5sHvC
X-Gm-Gg: ASbGnctLXmn1nXsj1kZTEgvD2BWY3sGqDwW7rXBxDuMrOsGkkn8S+yr33GjecoK4+xt
	n5gqbUPJaJLOaVkFIkRmcLLF8sIyr8IkGhLDyF2wQMKNdNmwD/8XhPanFlwah/wV0z1XNIPDCwA
	nrX9/qyz4fR6P2ahUNloO+7JB+VajOPqJekET13EQxhgHW7bggBH2qhVRYwmczFyAyo+V8MD9wF
	xU2uTMYe2lk1W+pN8ZtZmtl2tIW1NG2C8cs8jF25inBKOj1x6qwj8WV50ElnaVvhUGGRRz12yfv
	CnkKJ15QPg+/1EtXitNRe73CwTmaX05YYGNR76lZDd6r3+iyXn03f0nnqzq1fPLjFsSplN6CHg7
	XW0wMuCQVmxv7ZaJcObipJT4I
X-Google-Smtp-Source: AGHT+IFyQEfl1JPJPxf0BZz+v6ihfWCb5OyV0lLUdFcv0lT0Fbn28LslaGE9gKAirHH4EXO//Ee0AA==
X-Received: by 2002:a17:90b:2fc3:b0:31f:2bd7:a4d2 with SMTP id 98e67ed59e1d1-32476abd39dmr1551147a91.35.1755571951020;
        Mon, 18 Aug 2025 19:52:31 -0700 (PDT)
Received: from linux ([223.185.134.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3ecc64sm1315532a91.15.2025.08.18.19.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:52:30 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [PATCH] watchdog: cpwd: Clarify wd*_timeout parameters
Date: Tue, 19 Aug 2025 08:21:10 +0530
Message-ID: <20250819025159.6292-2-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
References: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reword "in 1/10secs" to "in units of 100 ms" in MODULE_PARAM_DESC
and the corresponding documentation to avoid misinterpretation of
the fractional notation.

Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
 Documentation/watchdog/watchdog-parameters.rst | 6 +++---
 drivers/watchdog/cpwd.c                        | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 0a0119edfa82..4257a59792de 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -122,11 +122,11 @@ coh901327_wdt:
 
 cpwd:
     wd0_timeout:
-	Default watchdog0 timeout in 1/10secs
+	Default watchdog0 timeout in units of 100 ms
     wd1_timeout:
-	Default watchdog1 timeout in 1/10secs
+	Default watchdog1 timeout in units of 100 ms
     wd2_timeout:
-	Default watchdog2 timeout in 1/10secs
+	Default watchdog2 timeout in units of 100 ms
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/cpwd.c b/drivers/watchdog/cpwd.c
index 13a4d47e68cd..c0a5c6f274e0 100644
--- a/drivers/watchdog/cpwd.c
+++ b/drivers/watchdog/cpwd.c
@@ -163,11 +163,11 @@ static int wd1_timeout;
 static int wd2_timeout;
 
 module_param(wd0_timeout, int, 0);
-MODULE_PARM_DESC(wd0_timeout, "Default watchdog0 timeout in 1/10secs");
+MODULE_PARM_DESC(wd0_timeout, "Default watchdog0 timeout in units of 100 ms");
 module_param(wd1_timeout, int, 0);
-MODULE_PARM_DESC(wd1_timeout, "Default watchdog1 timeout in 1/10secs");
+MODULE_PARM_DESC(wd1_timeout, "Default watchdog1 timeout in units of 100 ms");
 module_param(wd2_timeout, int, 0);
-MODULE_PARM_DESC(wd2_timeout, "Default watchdog2 timeout in 1/10secs");
+MODULE_PARM_DESC(wd2_timeout, "Default watchdog2 timeout in units of 100 ms");
 
 MODULE_AUTHOR("Eric Brower <ebrower@usa.net>");
 MODULE_DESCRIPTION("Hardware watchdog driver for Sun Microsystems CP1400/1500");
-- 
2.50.1


