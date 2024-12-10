Return-Path: <linux-watchdog+bounces-2522-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AC29EB1B8
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 14:14:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD120188563A
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 13:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E5F1A9B52;
	Tue, 10 Dec 2024 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaxNCZeO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CE81AA1D9;
	Tue, 10 Dec 2024 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733836465; cv=none; b=OgI6jYmjH3tbqBCtPXfZ9WNrxbj1VKYnziIA57AnM3+QWR3pQLz2iudawmUgoPJMgkZI81BnVgxwyLp1jnqTeTTTkwrsmCvbQESuMW8kiRTnzvVcycSm7NGU5dKz7oR37eDKU4TLkc5Ofao0xSOvDd9lpRMa1UyBdkCSHNB4zJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733836465; c=relaxed/simple;
	bh=I1kMuxalrG1tOiGG0XNUf3MZl+lBoT6EfqxAWJlD0Ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEHtX3NYSwTjuQ8khxCjtV3qwas/sNci7sfF/9tHs64AdWKVgx9jKFrQQpijkQNksaazumWtyee4kovDVHG5i9mYvJ0IAJM0WAeaykbDwWj/EB2zm9sEfkrRXAOQNd8exTe8Xwq6BAgHEZzV3JBu3VpGN9PV6dauqzkE0kzjX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaxNCZeO; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a90336eso3179759e87.3;
        Tue, 10 Dec 2024 05:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733836462; x=1734441262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gqpWJBq7pNV+Z5/8wJrRuTCi2gLfz4ysR6a191O5dI=;
        b=KaxNCZeO3jXn+aMufghiyN7T78dzlSa2G9TynWdPsKZTaV7gB4BXB3qQ0qwiNo0QRu
         h4MYBcsPtNdrjVrneiopKNdDF1nOOox57Q7WkAB/RsGmV0SSwm1GeS/rz90dr6bIPQG3
         xktWCHO3yyD1wEuIzJ+xX2QwZLXAFKCZAsZKt/Rq2VsImmiouXQZ4/hHykJHZTO/M0xA
         2y5KtScGEetRpwRcYzID8p3upg65CLhETmmeEV4QO1aX2kY8tXxVmwQd8fkfFFrRikMk
         Re4MgexidbW9gz9bl98kczoVn745dZwBIePMU4hRDPSUmtnBfR+9sBkksDxSh9ZPAk3x
         Z1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836462; x=1734441262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gqpWJBq7pNV+Z5/8wJrRuTCi2gLfz4ysR6a191O5dI=;
        b=FKh7woazkl3ZeBRMFfPebIc2eBFa2FqzdWXnRRuPYDb3C/iuM/3Q9IWKY70vu43wC+
         JbjC7HfEtUXzsk9arnIY9CzrcFwL6NzW/N9xWbMItanyLHNIbTxYYI6ajouibUu1gJHB
         o+88++Sjz5+uKgrVyrAYfAvbAihuwK7wEvhCOs0e34qD0ymTpeV5/VmsEaHLctIiC/JH
         xWUbHIvA/PUK8ReIVn070FwcUhs7CcSXep4THIFkj3PcXXZoYhz/X1Mz8M7qnP3nh/Ln
         8yO39qmAFayqaMrTtpRysN+GemV50AR5dMLRGw0PPRikrye/B31jEU4olLrkeCFvUtbF
         BNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYlx18kKO4BGncqnZxxlqbV3UQ5v99gtwErvC4kb5kf8dcXzI/n4SRiE3EpdXdDo5zCrfLTFqhdGPQnJ0ybw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj8mL6VTe1jvqesrk3Nr9T37Muj+GfQ5SF1V6Rgp3KCqKF5rDY
	vo2BeZzrWMz0+7PzTJhQfBgikGVDHj7XXHTzKIm9IVCFvOYmtS5e
X-Gm-Gg: ASbGncuBdKx4ztP99pJ1o0xbR9++wGdJqkYuN0h7OVwyjOkKbjvK88w1heEqK2g2L8r
	ikxrt9xr5p96Ts+ZCDKWAaW4zBKPuJ2/cmJ0MWWJ7bJ81i6zJRy7HAuSpxlqRRVy8moTO+MbpL8
	SdetoCJxn+5Tngj68W/rmbm57CAWl22pnMQkVSNJTxZxpYEG/a+J8M91LUoryl9P3pnz/DaM9bx
	2fiPjSIaRZNSTdHGOwD1qYAdCkcUSoxZynYHYrajRXdh5qQ8xJUzIB2Oi2pJbYA61jCVvocvQ3F
	gUpYTat50Xfmk5G/FQQ=
X-Google-Smtp-Source: AGHT+IF4PO4VVaM0fiSh4QGDnSFP/uyzaa5O/nzFOYsnJHWVIRUGYWIrfEDhD9ZvlBKFp4cB5F/WZQ==
X-Received: by 2002:a05:6512:15a2:b0:540:1abe:d6d2 with SMTP id 2adb3069b0e04-54024107498mr1596626e87.35.1733836462010;
        Tue, 10 Dec 2024 05:14:22 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ef5085b8csm1037589e87.3.2024.12.10.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:14:20 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 10 Dec 2024 14:13:49 +0100
Subject: [PATCH 2/2] watchdog: da9052_wdt: add support for bootstatus bits
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-da9052-wdt-v1-2-d026e0158688@gmail.com>
References: <20241210-da9052-wdt-v1-0-d026e0158688@gmail.com>
In-Reply-To: <20241210-da9052-wdt-v1-0-d026e0158688@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1485;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=I1kMuxalrG1tOiGG0XNUf3MZl+lBoT6EfqxAWJlD0Ko=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWD6haJoS/1xj8V5EEZL8UpW5m9vxBH5Bw19R0
 LfeUHfZpW6JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1g+oQAKCRCIgE5vWV1S
 MhwnD/9Cw40YpimcM/K2QWid9RxQL+W4oeWoF+PxVsRduAkOLkuniNGNo08qgFYTVtHOQ2rTz1a
 rfpGUx3FTGbe0nskuKnExDwaibK4/VaCpldk7wGiuWx5hjr05zcn/I12gxX7zW3klzZXRGDVGQk
 C+sdSBMsx4p0LTs91MyF5RotamumgGjc6sp1c+9o/A0EP2gMwi1EFQUQH0CGBaEfudoQ3+slQdI
 2lZCZm5rwi/w7672Uf2LUjlhk75BequTnOAfRat1GpzsYzLgEbwdIqZlovk5Nt1xtVjZUP8SLuM
 hV7FdmqZsqMBBkj6Rin0MR7IC0FJCmArf708hC9YgNw3eU8KXKNrYAWKSmwlmN0Kti3cBg6TRXT
 ek5+TOGEwXxMPv9bj6oNuh7uRx6XBdsez4SCmV2l6RXq8MxbBKXaYJgei2twnICtXLWNn/biAC8
 QJmgXzI1o60EBSC1YQaxAx+/oLIynKoRTOrQUcy9Y1HBdbnYzQQ773G/21ZVlwy5UGTUZ0MA3BS
 USuHX99qy2SkE7SY4iFXe2Vr5G5zsfkWc7bkDq0aIb41UQTjRMkSpkgu7zj33a6WBNAiUUpTgzn
 5OpffbFcvAVkp6Ju0lpGm5Vt0lei5d1PtijmhsOLBguYucO+hjJG6IvIX4b3b98m24bazio2wDz
 fiNqJ9evMY6ulYA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Enable support for these bootstatus bits:
    WDIOF_CARDRESET
    WDIOF_OVERHEAT
    WDIOF_POWERUNDER

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index d708c091bf1b1e3327a134d4d2244d4b883d14e4..77039f2f0be54273df1666fe40c413b6c89285a1 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -135,7 +135,11 @@ static int da9052_wdt_ping(struct watchdog_device *wdt_dev)
 }
 
 static const struct watchdog_info da9052_wdt_info = {
-	.options	= WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
+	.options =	WDIOF_SETTIMEOUT |
+			WDIOF_KEEPALIVEPING |
+			WDIOF_CARDRESET |
+			WDIOF_OVERHEAT |
+			WDIOF_POWERUNDER,
 	.identity	= "DA9052 Watchdog",
 };
 
@@ -169,6 +173,13 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
 
+	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)
+		da9052_wdt->bootstatus |= WDIOF_CARDRESET;
+	if (da9052->fault_log & DA9052_FAULTLOG_TEMPOVER)
+		da9052_wdt->bootstatus |= WDIOF_OVERHEAT;
+	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
+		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
+
 	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
 				DA9052_CONTROLD_TWDSCALE, 0);
 	if (ret < 0) {

-- 
2.47.0


