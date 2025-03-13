Return-Path: <linux-watchdog+bounces-3098-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EBEA5F3FB
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 13:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FA8A189FC10
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 12:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C06267393;
	Thu, 13 Mar 2025 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em2rFZBZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DA1266EFA;
	Thu, 13 Mar 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868125; cv=none; b=XLLfRvW38x9Ybfsh4foZsRkQy62dPK6OEngpE3j9FwPEltDHn4fWeJq/toxRmt/WtVk1D/i6E0q4GDs2NHEsYPtatfv5H3h4mrLuhuDJob9nwv3Pj3suETvvIeOoBBrApgJruue9PH+oPcWhDF00elifUlXmVF4hTrvUHSh5ANU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868125; c=relaxed/simple;
	bh=6Bw7Z5pqrFp4Dfdtst6FATAGsH9+hZ6V94NiRFJRyrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3Bf9S3gc7+ciSpGoXBHSkqNZBbYC/zTBrNKMOv1HXyXcONONoeH9F4AcqH5ni0J8v3ChrE2g/KUdiP36AryZNvSGvboJ8tCFogN+9GhqnYEvpEh0XvXBNTP+sokgzGe+B+Ok/80qrtuAtj+p0maQtRazbhM8Z9/1q3KLv6W7S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em2rFZBZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499da759e8so2200752e87.0;
        Thu, 13 Mar 2025 05:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741868121; x=1742472921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSl8xyKeQ17PRGrc6DnGNwaWt4mlGOqzwR8Cl5P9HxU=;
        b=Em2rFZBZJGGVjGlp82W/R39FcOy2uTGmo70W5krgns+uHHG3z+oTOlIYhKvOPEqha5
         +LkixmeLncmSsyWf00x4rjH5zoKBA7+rmrGAXzSuP07fIGuXAX4KMVH8Qs3oew/NfbYg
         7TWbsnEnWISfBe2rpYpfqy/Jp31DzEn4hOZ70YBMXq7fFWBTQRdh2pp5pUqE2+unnB9g
         uKx/XqmaYWbFFMVIQZJO1eX6Gx2jpqBK4X+aRz2HuVV33cHRbf6oTbqmyKynxh2fnhUB
         q/68cZ18GVOYMQ/9cDswagXfaSuuNA3GPmoNgzzVEdKdaKXCaGuD3zj4C0BQcupjGHlK
         YWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868121; x=1742472921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSl8xyKeQ17PRGrc6DnGNwaWt4mlGOqzwR8Cl5P9HxU=;
        b=HWaMVqhipQbrN4Qvelhl+OQrlgDboV4qgknwoRFWKBMI9hQbixNwXMtIquS0+s6G3X
         z/UAHRmkGWFJ3U8knUIKDPA+Y4p1kfvcR7e90uhL/YHBEED77ejmt+CIx92JvByJZAXL
         2ZlSvRYQ00gT96/km18jv9vDaYL9WqMo0veslub2IDqdPb5qL80LNoHbBYrjq7WWfDvr
         C5WmscgAKZWrr5CAkX/KdRXolcJ86L8iyxgic10XJ6oPEpy94EMiDhvagpBdaNAouY3c
         Sigo5I8bayMQi2TKoaZ7DpDGFeZQ5eYHdj7l8rO7fiAMznoGBD+kSWqkZObLgxEZnWhD
         Gsaw==
X-Forwarded-Encrypted: i=1; AJvYcCWpKA6S0oAMk7le1po9WUXBAYYOXSBOmB6QRPgkL5gnMoZH8BcFqI5wyqrdUHWgTJvutecq6bquqjOlUZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznbyynM+Ys7BWW6+CekPD4aZOPQvAAUrk0nmKFsfGikbFQy/ZW
	kE5Uz9W2iM0y35S30xHbHUTKgYuRpLOUmVGKKsLHdQvub5vpuVsOPV/2Bp0z
X-Gm-Gg: ASbGnct2enDCW6bpTbc0h/pCsOP59Hi95LQK0iS33XVmYTDW1DgIiIarKUGuS2vgFu2
	4jE9dQecsTlGJPc6rpsqycSSGkFyKQmiy+KrBbpWhS9isaOdYnnkybrnMGOY2AsZWf6BfJr+dO7
	8iyq+E5Skuuo/SnKlVYy4aWlAIhcQkZEAZAG5eQhiedlam2ABhtTWk8OwdYusFtCgXqC6exUG9n
	RGtriQJsRXDJ83DuM0QxW7xoQMvVE5B5/ymbFtxfrTVjHzKykNQuPlgWCO/TOmhNVBS4BtBohr1
	4q0bn4nflwRtsbnx/1udjgysht4ubcA1dsJU8/VQvVqzbbzsv+qqkCo+F8P4mKeRsJVJbGIVwsQ
	0aGAG1+sBDcOB
X-Google-Smtp-Source: AGHT+IFJpY+/avg2TRwEJHwn5ZdQgzKDVYL8MtVzMocp4pol7Gi2TEwPrFJnVUWlGgJ/JjbGWgTpzw==
X-Received: by 2002:a05:6512:158f:b0:549:7145:5d2d with SMTP id 2adb3069b0e04-549ba41be72mr931681e87.16.1741868121232;
        Thu, 13 Mar 2025 05:15:21 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c192bsm192851e87.89.2025.03.13.05.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:15:19 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 13 Mar 2025 13:14:42 +0100
Subject: [PATCH 2/4] watchdog: da9052_wdt: use timeout value from external
 inputs
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-da9052-fixes-v1-2-379dc87af953@gmail.com>
References: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
In-Reply-To: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=6Bw7Z5pqrFp4Dfdtst6FATAGsH9+hZ6V94NiRFJRyrI=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn0sxDvKeocRAvZy6zTCi67LABLkQ60ZOyW/jCx
 u/zdZOCz+KJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ9LMQwAKCRCIgE5vWV1S
 Mto3D/0fHdx5iAnYyIsyCaxtmCV2WKy2FISWKmyOdELdeFvca+vEMuy1k7CvnYKTACm69Lbb0pc
 zGovwBg1OQY6fc8vN6hs0UZiEIfxdqWq+2rwlxPFZqH9oTTzfHQ7jTntFr4Kd2rLiZca4M0Im25
 cyDnqKknw9+9dms1kEJdK8NOCVRYx91a22EIlCSBRuA/vj3ZFJS3UZm3Li+3tD1ZOgv8JeqOvSw
 4cF1iesiKmljOANT/8m2it7iVCAC22XrI3yiG6v0U6U5nrkvrj8JC9aRmKJKyg2EjHkcYarzZ1E
 /5G6CJYiU43FS4v7y0GxGUaBCc4FBFmZ++H3DJOSRsG+u/oQCSzRtQVwQHHTzXMIfXwctG8WTNN
 3aWCo+xfnTFNLqub35XYq+dnqHnjoSf2iFf+hgM88je2suVF7vFKB4mbOynMPuaQg3lAuGR9oF+
 z1Uzpd+1vKI8KAbokfiSRnc1TiRhv+AVD3jpbwCSQbCoGqScUWIacYgydQLkHeMVApkGpeNrkQl
 tFqi4dm+khg/YcZHn8oiQb4nIKZUur2kq2OzoTbfqZKao7LewyysR9jJskXYacs9hX2oahFQGGI
 wp/okNv6ujbX9nrIkO2Kv2KBHQMs140hFNZQ15GLmwDvDj0zGDqJVroQeCYLmhaBW07KcRugD4+
 bkHtYfB0OtSZXjA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Introduce the `timeout` module parameter and pass it to
watchdog_init_timeout(). If the parameter is not set or contains an
invalid value, fallback on the `timeout-secs` devicetree property value.

If none of the above is valid, go for the old default value.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index a8ff1e6a7903f6f139c5bb60d7d92ca39077ee04..fa9078d4c136a52f1193768fe93dc04189519679 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -36,6 +36,12 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static int timeout;
+module_param(timeout, int, 0);
+MODULE_PARM_DESC(timeout,
+	"Watchdog timeout in seconds. (default = "
+	__MODULE_STRING(WDT_DEFAULT_TIMEOUT) ")");
+
 static const struct {
 	u8 reg_val;
 	int time;  /* Seconds */
@@ -178,6 +184,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;
 	watchdog_set_drvdata(da9052_wdt, driver_data);
+	watchdog_init_timeout(da9052_wdt, timeout, dev);
 	watchdog_set_nowayout(da9052_wdt, nowayout);
 
 	if (da9052->fault_log & DA9052_FAULTLOG_TWDERROR)

-- 
2.48.1


