Return-Path: <linux-watchdog+bounces-3130-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3445A6EA78
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 08:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7F663B1439
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Mar 2025 07:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A9B253B60;
	Tue, 25 Mar 2025 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD3a+5Vh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB59252914;
	Tue, 25 Mar 2025 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887669; cv=none; b=OwtdebNx7xrODF0mpMCdWfCPgCYa4jHh4Cq1E930TJFwhjG0E3MS7Kwbona8eUlu+yU+eC89/k4836Qnb88ofZj1X5hbpVIela2dSW434HFw1sfb1AGrFD+8Tria3r7CknKGIGrp9tMJiKO2y4EazTKGDJuRcT4yZIDBcOVE37s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887669; c=relaxed/simple;
	bh=hLmDo0j13wZm0z98fG6esxZQVY5Sso4WiGan9W8ZMVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0ATffQ0rq54hRcE3jApkv9mxRNKu59UKA9xSuvmByO3bzsnL1aSBGwthdLZyNfHXf495plhZhr5MAqgEnYQZYenUTywqLieIzH+JkcYZPcyzciFNaSvI1DeJW7cYdK7fwG85N2EqPt+ac1ETkcK14D3bVQ7pB9Cp0bQXzAGFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BD3a+5Vh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so5252058e87.1;
        Tue, 25 Mar 2025 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742887666; x=1743492466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcWyZIGRZ0V0VnjdnEmGXkiK0tOATgxayTp5UfiuylQ=;
        b=BD3a+5VhD+UtkrYyY7n3MkauCSsrX0ssg23R5+Qwm9jej3NFL4wTY1cIPvfC+YinN7
         TVg9O7MS0S6teKPbX+CQX5wLcabCnOZqfJ3OG/1o0xRvFYlVZbUOk14Jom3izAH0C6wz
         SSIZDcRdHabNr6CxuGcEvDaT4goH92qqsq4QQ8+jBL1qmnaqI4g/HqiT0p4/wHCR7FXI
         2gX5oLzknWuull8xvW+aAvike6tdpz6kLD3smN3jhP8YoftfECn3QAunm9irmD9mYcRz
         LrNQdfpEg+7c19FxbAnbl0uZDTjLGk90ial9vc47Dtl0LjjH4zW6N2H1jzf24h0uq5MF
         Zwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742887666; x=1743492466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcWyZIGRZ0V0VnjdnEmGXkiK0tOATgxayTp5UfiuylQ=;
        b=JU3ZHuPa+/cD3r+H4GjOqCMag9+03MTQ3Ycw8o7dnjSB2SRWeIKeaXxFo+gJrXSJIp
         aJqDQcg+3dmuSf3e5zeF3+MKtJ2M0BCkezhkjiys6J7qWqEM10DmE0Ist6A9ik7X6UQO
         pjh/AUCZ0jpXo29qb4590ZrgEAYkMUnDOojIXlU/e1xxH97Oc6ZMYsDVGFI4PivAba+F
         CniDsBE79IhvUYl+aN8bIQpqi3qyuEP128fmPt4cHNjkgS0iSO1xrICWCCTKJ66s7Nl8
         xA3aukDdiGW9nmq3zEoHftT1V4vTWfjDexG77o+EzV5EmQTk4H9pkrnGE0lW1WWi95u3
         1xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4fCnZ8zk4y8MKvEqKhJT6BBliRnMo6AlfSK5foeI+QPGDT/UdZGUFpXNJYd9A+eii/aFIarcbjeC8wqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyFxYP9yvviLXc3TuYLAoLS4X9DwAUoBBjG2Th1i6kqS6zNZmP
	0iQHzgbN9P5LfJ7BHT0601mC1rtTEt5WS6fXWiKsgiUn2Y1R9klr
X-Gm-Gg: ASbGncs3I7Yn2ku6y5DWqA5Qr2eS8LuD2hZ0rVooG3en29CRTeAJiz/eXr/6A0r8UKg
	Auvzv6RVyXwv7aQev0FFLjbAVry48RoTWhrx/9ee/xKkcHTD1ndvQUseg9hitUXIJv3ozEVI9N/
	dIPWNH/x3IpYV8st907Ep2t+K9nM3HXoEWpPuSnQbpBX90rWhsN/zlNBF2id6CjQEWVjvqUsMFn
	UpTIW5TM/xmH1XdcHDfnFzGl4gW4cxfMxR2WSiNego0RqLVjBK7CzpkJu9fVYQ0aTjoJ9RBlX4C
	oWv+MlzaT5AHBVfJMEeqv73sopDjWyO6j/nJPTp6blusSF/usTaAaY7y+ywzaOUY2qIEdsQM4qs
	rP9O9Dl4eX8n5
X-Google-Smtp-Source: AGHT+IE7FFiW7JXr57+j+0FJUwzwVCLK8Zkw+G4PGno4kobEjFhr+H/V6N3eF1pDICu0klIW87vKGQ==
X-Received: by 2002:a05:651c:4cb:b0:307:deea:f576 with SMTP id 38308e7fff4ca-30d7e2d98e9mr68707721fa.34.1742887665564;
        Tue, 25 Mar 2025 00:27:45 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d89661aa3sm14307621fa.31.2025.03.25.00.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 00:27:43 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 25 Mar 2025 08:27:12 +0100
Subject: [PATCH v2 1/4] watchdog: da9052_wdt: add support for nowayout
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-da9052-fixes-v2-1-bfac3f07b4a4@gmail.com>
References: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
In-Reply-To: <20250325-da9052-fixes-v2-0-bfac3f07b4a4@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=hLmDo0j13wZm0z98fG6esxZQVY5Sso4WiGan9W8ZMVQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn4lrVlhf2NzXYQHtZU+bwbmgUO3jYI5SdQimcb
 2CLcJ/si6GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+Ja1QAKCRCIgE5vWV1S
 MsQiD/9fsuYwvTkMwJ3UuTlfl/hO9bj256odNd6Q+ANeSaPp2FMsfmCZPY4r0QhKHQDghcpwCXO
 D5t3JiYi3cvWDBYfqvQZiYWy/11NkxACQ2NEgcrH2qQhgpiKme2s8W/dM7XLwuIRK0ZemEeUB2J
 cn2ayqu9Y2KGUMIZB7rxN6/VGteVFv1Dn/dWSXM3kqCrl7vusIIrmDqNW9jfTV0/7qCpt/sx1NU
 iookTa2/2TsExPsAnRhZvxkZL1ErI1fmPXL6iYgdHqFnexTfaKlP9WJXNoxjhDlwGkJrI3eM6M0
 7/t28pzjP19dQmkzCtJ8pq+jybogicTkeWp9QpDsgy4i4rp+eGWCN3AbJPON1EfWPFxWiqPYYa6
 UAvgoPl10ALw+PqeuH9WYLb6j/SS3flce7u+FTj72dTR+m+KDLq1HOf1Vr6gUZBSR3oMANjjvHx
 s+FPQbSQ+EU/5LTRpNEMz8a1lsYmvGAB/ct088IO4EoS4U73CDIWvAzh8Gro1tmjl0sHiHIn/rG
 9ICI3H10uuSzjAtxfD8u7F9gAnSOzc8EOcwei9YarkJLSDZnuwlqNF9N2L2bcUzPOGngedDz8AE
 hvjEPWhU1q3R9TFE243PjedfJgLE5fRotVPHNWkh390euwzsowIRDZ5DQCZU0p1g6jLX2TMyGdN
 OGEgRdKZpoKnL9Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Add nowayout module parameter for not stopping the
watchdog when userspae application quits.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 77039f2f0be54273df1666fe40c413b6c89285a1..a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -30,6 +30,12 @@ struct da9052_wdt_data {
 	unsigned long jpast;
 };
 
+static bool nowayout = WATCHDOG_NOWAYOUT;
+module_param(nowayout, bool, 0);
+MODULE_PARM_DESC(nowayout,
+		 "Watchdog cannot be stopped once started (default="
+		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -172,6 +178,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
 		da9052_wdt->bootstatus |= WDIOF_CARDRESET;

-- 
2.48.1


