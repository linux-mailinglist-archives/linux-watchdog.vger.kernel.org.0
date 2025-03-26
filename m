Return-Path: <linux-watchdog+bounces-3147-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FEA7129F
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 09:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07AD77A5D26
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Mar 2025 08:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A6B1A8403;
	Wed, 26 Mar 2025 08:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cV/emBbT"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983AD1A725A;
	Wed, 26 Mar 2025 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742977840; cv=none; b=tJKzfiFzhxndoL9yGyuG/w98NzlCvb6zghjZtwmwivt7HcbIoEO5moCkIEp1tiZP2eFpluPk6F7LP0dUcey/6go8MkjsUJCWdIzWwPlgb6v+QWsaMoqfC46CjxAGfjva8q0YuQkQtlzpxC4JO8V722uwIJstZuMfHdRwwqSW1NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742977840; c=relaxed/simple;
	bh=jIH2FH65EVAhSCaQzDp3grB3CPIHOrlSznxm3LQRm2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqXDmFSLR1KCuCAacPoRXRgiwHm0hL/ZsbSxMkCm9WDMEPTgRRvOlZZhZXU/tIXPFjD/TbmKBYyJw6rBdrTspN/lnAtiICsWV9xBiORLANUPoUixEBWM8q5ctYQcCIBT6jdKt0RhA5A6RmIirtiMIaBv/koAebukLLFuEQ99/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cV/emBbT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54298ec925bso9644241e87.3;
        Wed, 26 Mar 2025 01:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742977836; x=1743582636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xf7+WU8vJbV5wS1BRoLMcTEzHaI42EtXMMqX+qEDiR4=;
        b=cV/emBbTd/pu8poM0zTxxiXd62HdQ573L8Q4+oA9xLhD0bykpvkMgBziVwneGQz8zR
         1qTrhkviqcKkovo8JGV7nDR7TSVIvE398GBP6eRF7yMzT4TjHicjwJ8temwwmsVhCsyo
         hZ8T60vElYD1DS/C7BZeIKZF+NSxSzZafWcHRiinRz39YCvoBK6oDGkf8fMgTZ70BiYo
         uvpi9jEj+JLsQudKBbpSLMBJAOXkrclN5v4shhOIhD2m+Mkgpg429gVCEWMOEQvyQmxE
         kSprDN70kgZln5swI9ofD40bHRWVH2wtfQtesfbGwA3XQXTVF49IQQ+vmvy3RUFUerIM
         b7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742977836; x=1743582636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xf7+WU8vJbV5wS1BRoLMcTEzHaI42EtXMMqX+qEDiR4=;
        b=tXK7SaD5tw7BgZDJlarhWy4caeXBueKj7i0OXVRwKGdGBpxA8JV334/5rbs7StIbG/
         cDAGQWPmfhSlKt+2gF7Z2HKIF9msUcQSRA2KK4SgtaPcoi7IdANigaKYT6sMEL0mawnD
         TmQqwBlAwT3430Wmi7m7Tgc2SWSFVLnF/ah1qnOrYIDrVFg5sBZHVmiYB22uRMe7VtCf
         6uZ7qTPiOKQjQ4pylfpCqYax1ywYE2vVmRxkmjEf9/0FU4CGb6DVPx3/Of6fM8jw7M60
         ZF/09vuyH2HMUvTNLKvHV30GU7Bce46uMGTwuipwhnmgkI8IwKsPmxOqBzjyJQ5HW2Nc
         9tzA==
X-Forwarded-Encrypted: i=1; AJvYcCW05JV3gdSMGUzGVzVFsjqD3IlYKWBZFC/Bxs+nWF/sloTNYoq49speZ87ntvPSinquD5snwa+u/fSB4SU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBV948iSdZrM1DDYYHVAGiX89ATpH71zOrfzg1ZNbVa3V7uI7J
	aPnkb1vfgJogVIWKqqqitopkglH0seYSlGmPYMQxP5r8QrZVf8wg3eSSbipC
X-Gm-Gg: ASbGncsYZv/kF+LpbJQIcrwv+nZUax1R+FKFPtjA4YtRHFrvtQGH16NmqfrR2htchrL
	KHid/U/H8A0BTw5qy6ep8BBU459PphBoVwtEBfKMwBungWnVJy8GeowlUr0vbWJIN9IBMmwR/7S
	C+oEKK+LbMbRV3+tAUZdulzwcqvAQ+CmdhbMGrNzu/1HcJUt7BgsFtMNDKUYRjaF8nGLz+r7e21
	+w14bcOba8LXbE5v1wWwTkh3BkKYTmBmbK9i2PRfr4BuxyzO5XbmrapPpv0MWV5W57X4d315E5z
	dyEA0bhwgtRBsuNPCvL689EGuAmcW4nETVvjgp+FL7t4zhFBZpsDpAruxBXOnWdDywg5zPY5p/b
	4gIMdimToW7UN
X-Google-Smtp-Source: AGHT+IHIsFlkAx8Qqmh7UmKXNgdgsKFVF8yox51r8OXmbeCiTTH9uQdrnJte07fuiq+l9gv1YIkayA==
X-Received: by 2002:a05:6512:3b0f:b0:549:8b24:988d with SMTP id 2adb3069b0e04-54ad640406cmr7648043e87.0.1742977835935;
        Wed, 26 Mar 2025 01:30:35 -0700 (PDT)
Received: from [192.168.2.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647c6f2sm1707406e87.79.2025.03.26.01.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 01:30:34 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 26 Mar 2025 09:29:50 +0100
Subject: [PATCH v3 3/4] watchdog: da9052_wdt: do not disable wdt during
 probe
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-da9052-fixes-v3-3-a38a560fef0e@gmail.com>
References: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
In-Reply-To: <20250326-da9052-fixes-v3-0-a38a560fef0e@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1255;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=jIH2FH65EVAhSCaQzDp3grB3CPIHOrlSznxm3LQRm2k=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn47sUFmFsLO2cL2i4WCzJ7YyhKSueJkUbC+gCS
 LNnbG+tQiOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ+O7FAAKCRCIgE5vWV1S
 MjS0D/9nnrRLYFGl1cGQPk7HOuKUcE+TpaD3uHgnSqHEZDIVhyDWRQMi5ECeRhSLGzDylaj5w8o
 ryM3FAnKVFJoL+8jC6eFD3U8OKggBLwHO/5yDPG6A58q1hs+W9+9P7nMkGdD1LZwqWusM3fEAhm
 /vChupueloioeEbUTPX56RN+cLYDcx5w8cGTvofW1s5l0I3+9uLT1c+GYdsTkrcA4AXEYLQLA1h
 jPvRVxA6QJfM+LXhQmW/9U3xdK+QZrbfpCrKJmWmUpGUXVxbYV4qVvxI4EsYhiqqfLZ0e91pSBa
 3+NGx9eGpZXNkqAFxXP704mF1CmAFtRiYsDTfl61Vix63q5Uh232Ip4JQ7HuILZpmHOnO+/bBMk
 A7TTuXFbxoKkC5CroQAICMAzaem3jaSywNjV5kyljREBZrn+u+Pq/iok1DFUTQ/RPsN7Ob8mniX
 LrNPxP7tmjKA3eBaqggy4hAR6w1hmhGbsuMSV74vQuhRjxx+gW8JUo9HII11IzggjVvnEM1rKX5
 YD1V6pZM+XJe3E9JqYCU7BIqXZx1StoHd9ICjVxqtK61u/3Fm6F69RL1J1RyQmRfOtmX0xYGsld
 CRQiYXU59RiulJVUPwrr/xyKpv5mtJ4tdROJxCTRVmA/04nzx6uv3Uz1bdQe7Tt5cNYvyUpng40
 9JNxvMDiL320d2g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

If the watchog is started by the bootloader, we do not want the watchdog
to be disabled.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index fa9078d4c136a52f1193768fe93dc04189519679..5bef70cb74b36412b427f5cf7255f16b8eb00ac7 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -194,11 +194,15 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	if (da9052->fault_log & DA9052_FAULTLOG_VDDFAULT)
 		da9052_wdt->bootstatus |= WDIOF_POWERUNDER;
 
-	ret = da9052_reg_update(da9052, DA9052_CONTROL_D_REG,
-				DA9052_CONTROLD_TWDSCALE, 0);
-	if (ret < 0) {
-		dev_err(dev, "Failed to disable watchdog bits, %d\n", ret);
+	ret = da9052_reg_read(da9052, DA9052_CONTROL_D_REG);
+	if (ret < 0)
 		return ret;
+
+	/* Check if FW enabled the watchdog */
+	if (ret & DA9052_CONTROLD_TWDSCALE) {
+		/* Ensure proper initialization */
+		da9052_wdt_start(da9052_wdt);
+		set_bit(WDOG_HW_RUNNING, &da9052_wdt->status);
 	}
 
 	return devm_watchdog_register_device(dev, &driver_data->wdt);

-- 
2.48.1


