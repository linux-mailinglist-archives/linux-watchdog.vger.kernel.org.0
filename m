Return-Path: <linux-watchdog+bounces-3210-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1641A7D059
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 22:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919731889D4F
	for <lists+linux-watchdog@lfdr.de>; Sun,  6 Apr 2025 20:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D17154C00;
	Sun,  6 Apr 2025 20:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WV7QwQl0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5074A21
	for <linux-watchdog@vger.kernel.org>; Sun,  6 Apr 2025 20:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743971738; cv=none; b=MwWDE3N4SxuRnRmLfCuhomi3TA7D3FJptvQIS2Q/CVFo21jSRYxTwB1RyK3M1aOBmJCnTklikgxG0UADlDIUU2ranV701ZP+b62jZu3Uzg41cjjhwHadOG74QGmaVsIFpFYpdfiKn0G9EfzjZdnU6w9eZ9XrvgL+MlwoFtbQT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743971738; c=relaxed/simple;
	bh=UbI8Gh0YS/za2rbwjxm9DmBDDl36qAmIDgTkA7RT64I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2VkcFLyt6c0TcmPlVfLq8nrR19cJX5gGFl0GgNH6h8GaJfR7eOtKWBV625KmEwKmaXIji2KBTpB7FrVQNXwusVz8SD6zSzk4bF1JXzJWXwKAbkCLjLUr0Q5sY1aVwaV1HU0sMbDR/N3A9pOyFB6lYjZZ4F/9jaeO3+X2Bp8InA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WV7QwQl0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39973c72e8cso402699f8f.0
        for <linux-watchdog@vger.kernel.org>; Sun, 06 Apr 2025 13:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743971734; x=1744576534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
        b=WV7QwQl0zGWbUNzrCOIl4wtl+cQmUZZRsXkkCgj92rTeCcPY+0btn4Vu7Wyd6JuIpB
         bWpQF2miyqzbM90o5VrxZbdWbcYFvkxlhuV/HAfzY0Ln8hqAZWyMlDq4C7QQ3NEiUm43
         32aHP8oCUjT70ikONK4pI8GXZmVtq3NRq0ryECKXG8ch1FoN0XsFAans2GrkbhbDWu4o
         Yyxoc3L2gqMltlmnSY7E/9vZVEbAN5U4Qrye17/DZ6I/lklfqCV5S3GLyMwHP3Pz/w5Z
         hmuGNR/7+sTI5PciHmmvsS+5fKJUcnS4/aSYimYqth0b+Jbq7MjtgGtnpmnPlxS1Jl5Y
         zjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743971734; x=1744576534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqE+fJoQoP5EIZsKKCKpe2hB/iRkIebJfJA+OiuqQwA=;
        b=SwpA+Joyl0wHEG0wQt6DV2M7VYapAsZgmM4f2aXiyt+FUlM+bR88Q++Vty8OFrBFqs
         hSlUuSh9K/zVVl3cnYkyCnviFIPG28ga8dRtQDmIuwWlws/gGiSAfzwVv1nUOsidRXGW
         NokVDYeuASbKJL1Aq1jkRreomhmiQe7UI8qTdcG64M8V83jCgAhvFENIe2MjiLax4d5L
         CCfBA9HJ0Qfon4Vd6E/0EZSqSuj9emv8Xocg/4z1JkJsMrAPPq8BnrrHzZ4rWrF2H/gI
         uLtofHFfI+N2+Ya+vT47nP7BIMDg9cMj3LRSIX/p3SXsLSRcKIIuHx/qupHP66k8zYGQ
         dI/A==
X-Forwarded-Encrypted: i=1; AJvYcCUVxtog8y/UbGrFuaCgL2sqXc2gPDxexteVV6ww4nXhBtI6328iioiM1DLraXaUSXcisJbHyvoZpkI0Lu4fmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzgWVOJqSK9Ep1mIv+TlWDg/IQU2/sH4X4CiL8DB6tMyvHG7t
	IyAvSiXOFvOSjpL1FH4Jq2hZHoymI1dlTGgHIa0Km8bGuhYP82CAPPuz3GXm0fc=
X-Gm-Gg: ASbGncuGPKU7iloiA7vD1JGMHWYwl8sS88a5aZVbRfUtjaBzev2tvDD/jEZ81r9hxVQ
	9JkIm6IbtJ/WSexAaGe5khP8G4uMefeKP4bOlb4M/JSVKulHGyE8pQd7WS5lEhGT6uymwg+Jfxe
	3f5fLfkgSAEx/vzofU1JHv3q0tOqhSzKr/oOrKI83OoIXmHkqEBlCLOJL2EwAsorx9sGFLtG84l
	Jmkq8mlth8RY3iI23LNtrlNKCZvwNzhGar6Zz/dsBtlyDSTby81bchISCKAd2qBbscV5fmUYrI0
	IWbZXp59KNQtuUce7A0Y4vtyrTSlRsM/6B6l8Qcbdt9nc+5iVtDRHA==
X-Google-Smtp-Source: AGHT+IGnWAB5N19dqxV+uf9H1b+D2cecFF/JdZzD4NafcpKENqOS32Y9IbVOYHktlCW19MYWLq1llQ==
X-Received: by 2002:a5d:5983:0:b0:391:277e:c400 with SMTP id ffacd0b85a97d-39cba93faf2mr3373054f8f.13.1743971734540;
        Sun, 06 Apr 2025 13:35:34 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm38022f8f.69.2025.04.06.13.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:35:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:35:30 +0200
Message-ID: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5ad..b356a272ff9a 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.45.2


