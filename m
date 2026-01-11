Return-Path: <linux-watchdog+bounces-4791-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B98D0F807
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 18:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57B1D302532A
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Jan 2026 17:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974441DF248;
	Sun, 11 Jan 2026 17:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQ5xRKPU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCD434A3DA
	for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 17:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151655; cv=none; b=ix1FBRK4vs1L/lQi1+HzY0D57B+1F33/8oJklcKjboLOxxKVWAs/He+J2xuDl4FBZd8MIdnCjISoV9+22WyE0mnKfXtmgglkGo6TuH8uZTmSW1DmhbHfwFq5y1XWjJ1HpKTjBlNArnmqIdbxmy9NSClgiqXzUZF8MnqSqQOBN3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151655; c=relaxed/simple;
	bh=8MvUYiqAy2DhTDiAOe1zexmhcH5cmS1/p03VaTB4nu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sAZboBsygbkcj0LkKuGaLw0sZ+DHv9/oVkX2n2YKd2Bp3MBMNcQXWLqcw9TwX2H5+WjXckxjTyUuVQrXZ889PtJn2jY+hecNyqb7fOEA9WQSZaPo21Y13cSSGZpImEsSftieESN/dVPVbRngI1qRYBHw//cryDNHPyW6199rohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQ5xRKPU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so43317135ad.1
        for <linux-watchdog@vger.kernel.org>; Sun, 11 Jan 2026 09:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768151654; x=1768756454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gk+oWVMa9/CD8uMm+hfIDhfGbzYjaq5rsbbO2b6oknw=;
        b=iQ5xRKPUbdL1yiIpmRYtn/kfZyhFTfqzO/vApleVm+bdPi2tZyX+Z5w6XVPjs152Gf
         SG6s6WstzFKX1EiRDzNrVqoQcTDUrui41WgAC9JLUXxC/FKG1EQdLPUgs3H3UnFVMRYQ
         gy+68wAUUbbuMCkSRbNOJhPgj4epyxDac64yAZmCwpruiu0KaOCse2aDIkeRvjBz+zsK
         O5c7cGILGPucUv67zmhoL2gaylL2cTwUwbbITNdUwm+Fvc5WQC5X0p3oh4jO6kf1N8c4
         wn0R2XcabQuIf0xJVCYrJb4vojfnJ27GPAjbxhTLr9QahtGhQbqVEHTWLZS4f9GWgo8A
         /2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768151654; x=1768756454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk+oWVMa9/CD8uMm+hfIDhfGbzYjaq5rsbbO2b6oknw=;
        b=PkJj3k/K8xAWGPFhSfoTyCYreDUx8W83QFF4zS902n2nSuIhvy7+lpjR90zl+oCGp0
         UYcp9+nYRqPQvttlGoGJmeJjVjkVj2C25yUC7wWFFUFNkY3n/piP1S+qT5J6vISPmd56
         E4Afm9xFf4mthOoR8eFzA/U22Nd12AG4oNtEtzDa802B8QXMbZIfqJTxu5Hm4n1RBEv5
         8wM4XzXcMG9i6tKEhptyZ8W7cixqgDjGAgxFvV/Io2b0kHuFf2xsxNRvBll5fLXvasbZ
         Xkke0kYFj0O+/URHRcFWyFggRaOlni82AjR4F6pusz5iJjaAxe9+j7+sw+QwxI9w4Rgv
         S5Og==
X-Forwarded-Encrypted: i=1; AJvYcCULxMn7Z0kV5EDR3SykQdLAmbC7ATW9EEleI8x0HoNv2ITe9VLxHUzmC4LjgZYIAnEUUBgHnMvsW4cj0h/XjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaAj3Uo/JV0gb+s0rIpAkUieACYs4HWlpUj+U3HFVi+wolXFG8
	fhKskZB4XB2OpqUGi3FF/qEf4byGVQFXPIXWoIyJUo+wA/G3g2K2wn+YjdBinad7xPLD4wLIqg=
	=
X-Gm-Gg: AY/fxX5C5Q402Xnni7vxq4cUfz7vJFbDVBFI8NEeQOQiRn1oH1M66C9KK3i1a9+msNY
	AGTJphrulR+epZM/Vm9doTffbth1nRC7ePwK2kPqj2ER2RA+az7VFe0eD2rXmkTKesZohWJmWYz
	ukdhPCDr0k36NjWvQxSaA5XzkvtA1qzE812XPbkMyQcXmuYeUq7Gnzg4fcT1Bw4zw3y7lRn7Tzq
	sYD7QtVbgfLPIPx31m9IquDmD2UE0/Y91Ihm/Rwi0eyaVCeF3j7dk7cs81nRmjLAHCUCzsKbdbj
	4HXtJuqgBLirRmd9W3x6QlC3226K4Hmg4FpxN4dLl1U6ynk0gcuGO85UAn7xXczpICblte7u8tX
	WGPMIzkrxZRcyAe1j4wazou6oa2Z80XQhsQXtoeQeQdLhvMXogWlTknaUbyJMuX9BrJwisx88yU
	D2NKHbKbN/2rKa7cxk
X-Google-Smtp-Source: AGHT+IHTPKewwcqIeEBotpOhs/jd5E0sIedoNy6/NEG/mnKKoH+OfHASgZuXJnELaveSqCb1zOjgiw==
X-Received: by 2002:a17:903:234a:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2a3ee49c6cemr151068525ad.42.1768151653664;
        Sun, 11 Jan 2026 09:14:13 -0800 (PST)
Received: from DESKTOP-BKIPFGN ([45.136.255.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4796asm154741615ad.34.2026.01.11.09.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 09:14:13 -0800 (PST)
From: Kery Qi <qikeyu2017@gmail.com>
To: xingyu.wu@starfivetech.com
Cc: ziv.xu@starfivetech.com,
	linux-watchdog@vger.kernel.org,
	Kery Qi <qikeyu2017@gmail.com>
Subject: [PATCH] i2c: cadence: fix reference leak when pm_runtime_get_sync fails The PM reference count is not expected to be incremented on return in functions starfive_wdt_probe.
Date: Mon, 12 Jan 2026 01:13:46 +0800
Message-ID: <20260111171347.2170-1-qikeyu2017@gmail.com>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

However, pm_runtime_get_sync will increment pm usage counter
even failed. Forgetting to putting operation will result in a
reference leak here.

Replace it with pm_runtime_resume_and_get to keep usage
counter balanced.

Fixes: db728ea9c7be ("drivers: watchdog: Add StarFive Watchdog driver")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/watchdog/starfive-wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index ed71d3960a0f..af55adc4a3c6 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -446,7 +446,7 @@ static int starfive_wdt_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, wdt);
 	pm_runtime_enable(&pdev->dev);
 	if (pm_runtime_enabled(&pdev->dev)) {
-		ret = pm_runtime_get_sync(&pdev->dev);
+		ret = pm_runtime_resume_and_get(&pdev->dev);
 		if (ret < 0)
 			return ret;
 	} else {
-- 
2.34.1


