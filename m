Return-Path: <linux-watchdog+bounces-2521-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111809EB1B6
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 14:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119FE167E9E
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1378F1AA1CF;
	Tue, 10 Dec 2024 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OV/JeHZn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A251AA1C0;
	Tue, 10 Dec 2024 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733836462; cv=none; b=V9cu+bIafObYvAWhPFdfG53ViLXQDz9vLKbjqQ3P/PGtBwCBN/RqPmrlP4TQTFwnkgsqG8x0hwfsjvFv13WWYvABJyPhstYNAbcSLndlEkBcyHMMOMA0hHZggVF6ed04xB2z4oCWzEwzzGf3ezK8u1YikTTpBFqcHwtIEhZJevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733836462; c=relaxed/simple;
	bh=8p62SIBj9xA9S/s2NGpsuQaZLOVV+vtzKIxOZDeXSy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYzmSv/hsMjToDku4yd3ijKozsRYlonW9XUAVU8fLVQI0ezx82PyewuK5rzory/yks5+bDd1guDgObYO1UFJRjqKpj7nrMHtfApGo1yaXsMdytDnZp1mD6JLJsqBCWfES7fdMqIiQ6Gp0rFqmsC6KcVJQkEki433lC39o1abm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OV/JeHZn; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso59367131fa.2;
        Tue, 10 Dec 2024 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733836459; x=1734441259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO2Jsjs/yK61act41gYgzTBxs+CYecIxBDcgFhBolBU=;
        b=OV/JeHZnwzPRdsjFuW92giYUJZDpeGxI1+yTV3SE9/+vsHZtx0fdXKbmhv9/e3a/vm
         RSXSm3WBGZ3mElSWTooFhSksPhhq385js056JhZw1xrc0BND6WNLqfW5bQXW4cDT86FX
         lHysDkw5zzaO7T5JJuiTrSVvliZ0lONykTcD4fDtYPrRIZxOJH/i9lXb/F9iqv2p5813
         DUFmcUoUMZCpp2cv7tqr9v2YaobHsIabvWyBk5EKA+70ZSSvbRrqI9ulYS9/xIP7LMxN
         41BClbmIYC1M5EDSEdGBzg3ylmlOrPC40K0paH91G33ew2LGIP2MjFRmkgo2QoncrVMU
         R1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836459; x=1734441259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uO2Jsjs/yK61act41gYgzTBxs+CYecIxBDcgFhBolBU=;
        b=tq5VnF6C6ar/zeN4sVGaFQQxdcVM/XKUOKgQDBMV9U1t4JP/h1gXWV9u8DXGSUMfXu
         hgA473PYHttS8o4lgLi4xpY0vbbrw/poiPcLTT8dI3DuFEN3OL2a4eCicXEepl8kRmFu
         yDpxhWNMBDnNYtxDUX5FpCauavL5XGDIjRTt74AL7EdrAZ5NTnOAjt2Nw30Zjc0KVIYV
         qRiEvKIgdrS3uAV4ffLs35up1C24h2QD5JmwVxWwGFXE0R/G9XrxQviITNkDfrLvlGIw
         9vZLx7BSxdgkhfR1ql+ngCaYFRFSJJ+2HDqhD1bsZSDHzrWWPg1vrxepJf2CG9zfQYap
         rtbg==
X-Forwarded-Encrypted: i=1; AJvYcCUwg1qjvvOGYpSHvhXssgnXSkl66wQgZA96/pR3w68xTEEuKc8C1hwasjzG7yIbp7c4IenI8wDuxQjZxkPhRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS0YRvwuCZ8iKvVEFil4fL7pQTO9Bt+38AqPj1zTLQsbQwmFXv
	Y5CPWsDWtstWRjZf2Rexxy4UxbWLverbcM/dQ61Zd2UvCIhqAtQm
X-Gm-Gg: ASbGnctw+DI7/iXaCzNMTktNUIbuhQMSGU2GMF0+m42J4cL8O0CX4Gp9WaT23p+2x+A
	cZzzQSfurRJlLdPGtnP3NkO1ME+NBi6PuMyBl30FtGHSLvAnE7OXFH6DfCDBVhyWCjGJ6sQKx7G
	6G05XkXR3HE69oulF+QYAPqcVK8DsnKJt2LASXztJZSIgO20QtJBmdS+GMjIPkLonjASVa5IunH
	Jw5xiiN2biquj2wTuzpMzw0/yrUXQw9lPtu/LFSRVvYRYOYsgeNjU/ICYtE2YbVJyd9GUG9rODK
	/qJgdOSChbbswWTb35o=
X-Google-Smtp-Source: AGHT+IHPW4OGzKVFUrU47f9n/ojFWKiH5ctUgroOY+FaaCPw6hcDUS/tjeKcT7USTmzvs75xK0Ve+A==
X-Received: by 2002:a05:651c:199e:b0:300:3de4:ff90 with SMTP id 38308e7fff4ca-3022fb3e31fmr14868011fa.5.1733836458979;
        Tue, 10 Dec 2024 05:14:18 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ef5085b8csm1037589e87.3.2024.12.10.05.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:14:17 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 10 Dec 2024 14:13:48 +0100
Subject: [PATCH 1/2] mfd: da9052: store result from fault_log
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-da9052-wdt-v1-1-d026e0158688@gmail.com>
References: <20241210-da9052-wdt-v1-0-d026e0158688@gmail.com>
In-Reply-To: <20241210-da9052-wdt-v1-0-d026e0158688@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8p62SIBj9xA9S/s2NGpsuQaZLOVV+vtzKIxOZDeXSy8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWD6ckm7tNqMF/13u8rGlUtpeHAlDA7eQIfSMY
 ftr0nXHiP6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1g+nAAKCRCIgE5vWV1S
 MmQfD/4lZ+prQdpVN20LunKlnFiiHSeF6lR5GH7bZNq7s8UNoEd8ncB/zUJaqgnFB8KnV0ObWAb
 llRz8DgjBEv3DtdoMkEA+xamagPAjUwjnYG+DvLohm1OlplHdzUcGgqdVjvB8+vLKFCej235Js8
 sDrr1zt939khUICb9VJ+ZOLQ4JlCZMx86SRW+Txj4vl3VGJWJl2qlVPP70uFA2HH+86N2P3gAYK
 S0Fe6j61f2MXgip0LAoW+BQgc0TpDEljRHOj5fyT8bejSDTcP3P19ieY05rOdAuNANa9w1OdjFZ
 eHvtMdgkSUjHcsdRpf69H/sr02Q1CnbelBu5myqjx2/fEhOB28iHVc2fqt79o5epLL/mmI3Ma+x
 l57iw/gCgl4DFrgXOkhouCVx3WWXP+UJRmh7WfK61trILWhtCtAnSLZGGQxRetTKS+TlQbnU4g5
 UDdOfjy39mcBZa1WhsbJ/hZjnY2ROAFqSYGo6+pSNFzGfoGqCOIuI8A4VKn68+zdZSobLEvlFMB
 StbRP9AKFy023FcehVadHHie4qYpF3pGEWIOgEpqpqshblnPdLnNECy0xGITJoEJPQGaumNTrz4
 bnE3MqXvrAjs6Ye3AMZ/nUePPHeGe1Ifg2VcbvBLD20upzOyneeRuj5F4zTo2IbDzcY45XUULYl
 fJmpZPp66zfq+hw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Other sub-components (da9052-wdt) could use the result to determine
reboot cause.
Expose the result by make it part of the da9052 structure.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/mfd/da9052-core.c         | 26 +++++++++++++-------------
 include/linux/mfd/da9052/da9052.h |  2 ++
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/da9052-core.c b/drivers/mfd/da9052-core.c
index dc85801b9fa0850fe4dbc351014b7f2981460f02..17baf02b68d60198ff7ec69bf49102423b822d0b 100644
--- a/drivers/mfd/da9052-core.c
+++ b/drivers/mfd/da9052-core.c
@@ -545,35 +545,35 @@ EXPORT_SYMBOL_GPL(da9052_regmap_config);
 static int da9052_clear_fault_log(struct da9052 *da9052)
 {
 	int ret = 0;
-	int fault_log = 0;
+	int *fault_log = &da9052->fault_log;
 
-	fault_log = da9052_reg_read(da9052, DA9052_FAULTLOG_REG);
-	if (fault_log < 0) {
+	*fault_log = da9052_reg_read(da9052, DA9052_FAULTLOG_REG);
+	if (*fault_log < 0) {
 		dev_err(da9052->dev,
-			"Cannot read FAULT_LOG %d\n", fault_log);
-		return fault_log;
+			"Cannot read FAULT_LOG %d\n", *fault_log);
+		return *fault_log;
 	}
 
-	if (fault_log) {
-		if (fault_log & DA9052_FAULTLOG_TWDERROR)
+	if (*fault_log) {
+		if (*fault_log & DA9052_FAULTLOG_TWDERROR)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: TWD_ERROR\n");
-		if (fault_log & DA9052_FAULTLOG_VDDFAULT)
+		if (*fault_log & DA9052_FAULTLOG_VDDFAULT)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: VDD_FAULT\n");
-		if (fault_log & DA9052_FAULTLOG_VDDSTART)
+		if (*fault_log & DA9052_FAULTLOG_VDDSTART)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: VDD_START\n");
-		if (fault_log & DA9052_FAULTLOG_TEMPOVER)
+		if (*fault_log & DA9052_FAULTLOG_TEMPOVER)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: TEMP_OVER\n");
-		if (fault_log & DA9052_FAULTLOG_KEYSHUT)
+		if (*fault_log & DA9052_FAULTLOG_KEYSHUT)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: KEY_SHUT\n");
-		if (fault_log & DA9052_FAULTLOG_NSDSET)
+		if (*fault_log & DA9052_FAULTLOG_NSDSET)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: nSD_SHUT\n");
-		if (fault_log & DA9052_FAULTLOG_WAITSET)
+		if (*fault_log & DA9052_FAULTLOG_WAITSET)
 			dev_dbg(da9052->dev,
 				"Fault log entry detected: WAIT_SHUT\n");
 
diff --git a/include/linux/mfd/da9052/da9052.h b/include/linux/mfd/da9052/da9052.h
index 76feb3a7066dd4ea2f7768794b8920f67726b211..9cb2fc2938cecf6ddb76da401ae3a098525c380e 100644
--- a/include/linux/mfd/da9052/da9052.h
+++ b/include/linux/mfd/da9052/da9052.h
@@ -93,6 +93,8 @@ struct da9052 {
 
 	int chip_irq;
 
+	int fault_log;
+
 	/* SOC I/O transfer related fixes for DA9052/53 */
 	int (*fix_io) (struct da9052 *da9052, unsigned char reg);
 };

-- 
2.47.0


