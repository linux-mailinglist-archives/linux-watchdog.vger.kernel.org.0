Return-Path: <linux-watchdog+bounces-2233-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C809A4092
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 15:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF5A0B20BAC
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 13:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE511D88A6;
	Fri, 18 Oct 2024 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJc0oCQ6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD3F41C6A
	for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259914; cv=none; b=PuNqxeJuDx88RmLUn8wYL/pTBNAZ4q2rYM3sc1syMc6Cd/O/jvAdxB6D+QRlxBBNocK+bnbdNV/UMlEas+ys5VNOx+UiBB2kod0eY886w088x1YHHCAsDsgWEI61eUi2saG7FVY4rnb/n6ArOgVi0Cq5Ohh2VBMHbvrdQxE33Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259914; c=relaxed/simple;
	bh=4ljERmlq04NIdijeXAfR6GU1swblTXcTV9ZTQN2WuDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dxla7WJQUa5vyNIBrt24kJVWA+suryHAh7bDvbZe6UYzRvctwRTmuDDQzEnPJLYoiwba8p9z/buNz2fdHhOUBO4+5afcVmn49AZ4IRmhlXhuNYgfUgpDOFDlNhTF0F/RZPCpgEb7En3KAMLqEyCMsTsCj9fTa2DYjXzCcA6+jkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJc0oCQ6; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso1467033a12.1
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729259912; x=1729864712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMtFa5Iav8nOY6O1wrCG9UoNgb0eztQLEetiKJzPO18=;
        b=dJc0oCQ6rL83RYfVAAKa4bVr0Ucyb/V/DVaeGP2fgmWGojvgkuPQTC5YIOLPnndawb
         abs2+bCXBYLNVIERrMFBtDFUf6F7CMmRdQHYf38xWVdQeN9pbocUya8oXfvk9VP7mxHt
         H3QbnL9luiyQ7LyDGpiJX1drdbUfGLOpXZSVBkmEsVkAZY8IngYmKRZuzbj1DpNCkHUR
         Ok6Lyn3/hv7GPMC5y4dsiIhbD8tsd+FRMkmGguCZCkEV1p+z/D0sMWDIGoqSgeYvziyI
         bya25VSOQbfVOCVuCGE3p+sFHQeUvLhDVhZLemAlcN8lLZ2piEC+vNTOdM7nf3loDJDu
         mAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729259912; x=1729864712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMtFa5Iav8nOY6O1wrCG9UoNgb0eztQLEetiKJzPO18=;
        b=qYrghcF98TV0OAZ6n744LEoF618hpJ+8OoQtoeK+A3sT6EV/kD5RTCLS3Xg0De4Qpg
         5C6nCD2gb36fBV/kE1haQz2MxF97DgjZfkqkE3okj1oTITgo1Th6x7qHy3AS5gQC/mez
         +FC5Vzu5A4FGJqbxswhxDJvR/AMt1qptOLS7sLkBgKZDdbsKZPeWlo+f40JStpU9R4na
         Aamh88wqri0ioMp3cL6fhjHPP+27AcRL6OZXlvXS65O865+3IMrXL3hwfQtOt88KShvw
         nPhzzSWWiV1otx2OamrfGZ+rh/raEx2ZTMT/gd1rFygQMkeSiV8uyV3s5LYwsJYsxknX
         Rz7g==
X-Forwarded-Encrypted: i=1; AJvYcCW2pvmBz+n8Urx9+8BR5wflJa/aMNodCilXSYgVcPaFcDU4ZxmzspgOvbDO1oodutnzlYGYGMlEeMu4B3oieA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOMBp0iMkt+WBl4y1UZuheqKWlmN0xMQydgQPOY77I5wbbV55r
	pS172cSGivjnc2M3/VcNSkHa0BA9L+pWYbPyRGD3gH2yAiX5J7+NRM7nyw==
X-Google-Smtp-Source: AGHT+IEoH0yNBqudmkqHpcZUevIZLctpochodWVQDQQWLMhz5itszleTzEY2cpd6anBEdyKGEDRExQ==
X-Received: by 2002:a05:6a20:d80d:b0:1d9:761:8ad8 with SMTP id adf61e73a8af0-1d92cb8c2a8mr3342046637.21.1729259911970;
        Fri, 18 Oct 2024 06:58:31 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ad3c:ece1:18ac:9bc9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f16sm1448482b3a.40.2024.10.18.06.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:58:31 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	support.opensource@diasemi.com,
	linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] watchdog: da9063: Remove __maybe_unused notations
Date: Fri, 18 Oct 2024 10:58:21 -0300
Message-Id: <20241018135821.274376-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018135821.274376-1-festevam@gmail.com>
References: <20241018135821.274376-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
handle the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use __maybe_unused notation.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Newly introduced.

 drivers/watchdog/da9063_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 69f884cf1a7b..92e1b78ff481 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -263,7 +263,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 	return devm_watchdog_register_device(dev, wdd);
 }
 
-static int __maybe_unused da9063_wdt_suspend(struct device *dev)
+static int da9063_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
@@ -277,7 +277,7 @@ static int __maybe_unused da9063_wdt_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused da9063_wdt_resume(struct device *dev)
+static int da9063_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
 	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
@@ -291,14 +291,14 @@ static int __maybe_unused da9063_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(da9063_wdt_pm_ops,
-			da9063_wdt_suspend, da9063_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(da9063_wdt_pm_ops, da9063_wdt_suspend,
+				da9063_wdt_resume);
 
 static struct platform_driver da9063_wdt_driver = {
 	.probe = da9063_wdt_probe,
 	.driver = {
 		.name = DA9063_DRVNAME_WATCHDOG,
-		.pm = &da9063_wdt_pm_ops,
+		.pm = pm_sleep_ptr(&da9063_wdt_pm_ops),
 	},
 };
 module_platform_driver(da9063_wdt_driver);
-- 
2.34.1


