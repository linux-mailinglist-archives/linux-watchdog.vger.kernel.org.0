Return-Path: <linux-watchdog+bounces-3100-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7D2A5F3FF
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 13:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBDE03A3076
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Mar 2025 12:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BCDF262811;
	Thu, 13 Mar 2025 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJRY1Rxo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560662673BA;
	Thu, 13 Mar 2025 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868128; cv=none; b=O7MuGaByShHcstPOeUeLptEoSH26kaY6+WhvD7RujzWxzXlVJfqT/Gh3kim4Z2tQqc5EH1GAH6pOJqT9uLN0QRHO1Q97UnsmtLAmYMoVr60FYO/nBcOZfL27zAkxS2AZrZqNhRTK5R4JgWVd3ZjfAhyBp8RWt57nvvdDJnE9URw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868128; c=relaxed/simple;
	bh=msRQvskLF0OZgyr0Nn2gFUtgHE+JQ1Q+SpkaJxkauws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HW6EIMKVOTFTXT4d+XcRr11H4hfPpvTMiVxa/8LJkvvXEdiZ1j4NVVmIDdnNWrBFuFCX49ofNTcsojB++AERz3Bn2U5ChPtHbBACwmv67C2vVGmwcXropBjdfEVR7WWrIavZHgiLSdxbhkXfHxgYho6aJC8ZbGZCNz/s/if0c8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJRY1Rxo; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549644ae382so1008884e87.1;
        Thu, 13 Mar 2025 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741868124; x=1742472924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EX8q9UrYqVDJV0DCL4gk761qzs/ghU5IMPiNSIbYdrU=;
        b=VJRY1Rxomem9o7mHI16uMgqpPHedNYFmkWItA7uP2rf+J94QnVcUiybc5Td/E2wHyf
         DYrh/7GLuHBGFNpbncFzwWeoxSVVFSiIbXZMZhw7Mp7cXM5GY7P+XbpHXfQv5IgaS0Ch
         8mGndV+bG9rY1JF7otXbMZCeBr9ggw/q08xEKfrNJph8ageLoxVfpYpoc77eApEcW8NU
         afdw44AGbz8hfZidsrYIz99i1OD37GJTUYtxHRY0qJxclaK4tjw+T6vPHc6mOjhjjYZZ
         0UYsJxkKct1oMdhTXzcyPKHtmlFvJTqRVHVeRWyu8OBjALd1ZFXVl7ZX+KcbJ+VVzMP5
         PanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868124; x=1742472924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EX8q9UrYqVDJV0DCL4gk761qzs/ghU5IMPiNSIbYdrU=;
        b=U2sB3HavkJ6Uh3jORwNJpGpgdiPrQHEdizXYWZjn7id3C4S5csT/oDkxLhF4h1Ajtq
         l9zBBZnzlxjnTDF63pubD0FUs68fZE79zvGuCy3PyhNBNnUzYy3R3Ww+wV2MzVUTScNc
         jFQvODtTG9rT7DjPDyuPC8XIMqBEdzkt1ZZX0WMyzr0cAQRSuOEQbI5QYqc+Vk7CcJbz
         yjWX53vJjjk/i52QZX0ifVOo/wKHfLiPkldugBFsOqwIr+kAzrH/EIyPmO6X07JLdumT
         BMB6wnuvnpgYMvhDqR4gRk7Z/Mh99he51FwwhzHVxc/BucCCj78avIK5vkE0q8V03TaC
         AfxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBNdmCWnOn2xjmGrEMsr0FtkagqYB9lSsZa1SE/AoLf+Eqv0DRSnbVc4pRO4xNDY5T4IyMnIaQwAmR0tQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQp6dSA8SPIuXPQtdnpixtmw70MOHDQeGRqqGlY8Cyzvaxjt+9
	j914Qr1wZnbUyK8NtRJ7Fz5bjMCAfbpCcMs0iIza7ldMm8mR5Q4/
X-Gm-Gg: ASbGncsrylzDh4UQP9dE5Cod9wjh5UwPU09xN5FbVhq7nWegNNCUcdveXWa0ZNn0byP
	IKUp+o3TVtnA36wYLYFcCWT5U7eXD6xxPuKqhUF1w4jzKlZinEBteDZX7lEUD0ffIlwiz31wtaG
	Bbw3ZZmyuw5tnnPBO+x5Ic0RZFjvYd35t7zk/Gpjw6Z/W2YqPSW29ApdwIBmVeIatkONt+JRxWw
	Hz0coYY4pCU5/zT3AZJ5WDECfXaGflYloNOrCVe3vEIMyKuYs0qGfhe/xG0l62uphRWn7aRsLgy
	EYQnhDromxC0f/j7TuJY5WQf0Wtgfmfa8jPTV2CuKwmxxUW87SYwVe5/tkXetsE90ZpgOO6bAl3
	VAmVFkQA0ZnEM7satsAzD6Gs=
X-Google-Smtp-Source: AGHT+IHMRtNCp83Y5VfziuGToqqqNP58sFYcJkuPp1RzeIUqXPMosvv/GKK4Fe03sF47GiIrlqbP7Q==
X-Received: by 2002:a05:6512:1242:b0:545:2837:17d0 with SMTP id 2adb3069b0e04-54990e5d3fcmr9433873e87.12.1741868124206;
        Thu, 13 Mar 2025 05:15:24 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c192bsm192851e87.89.2025.03.13.05.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:15:23 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 13 Mar 2025 13:14:44 +0100
Subject: [PATCH 4/4] watchdog: da9052_wdt: respect TWDMIN
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-da9052-fixes-v1-4-379dc87af953@gmail.com>
References: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
In-Reply-To: <20250313-da9052-fixes-v1-0-379dc87af953@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=945;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=msRQvskLF0OZgyr0Nn2gFUtgHE+JQ1Q+SpkaJxkauws=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBn0sxNyp/FjToxW9L13vbZBkc33m+xJJc7q48ql
 mVpKIkU0s+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ9LMTQAKCRCIgE5vWV1S
 MsckD/9h1UydeVp6qsi+uKW5zBfGDCsGW5VxuZlyfzEph8LSo7bvEZ7zza+keb/Zr++SzDK/swb
 VIKvjFQX7w/0RQ78pJ9tdLPnbF2lj8JarD0SOSgo6pyxNLLUTKEa1WOQaBntXjY3oyQpBTqrob+
 29lgnNKYd7O7Pf0i0ROt2qHnmqJlOOXtQMh8AsfycyvPr7t/aX7V6uNm8O+VXsQUWdlQdLfSgKT
 AYZdu7bh0UOkjsXCNWwM0aRNpNsbjMhW0+vKWAdBlMOqLqR9Uum4jkPSQ1e52mzVwwrkur5ZBr6
 u5whBqWQTzsmvjYYbKVzFkSHQB5/Brm8h08qeajZPyYL+0VGXUBs0fqZGYvixMPIFmnRLCTOC+N
 g/OZTAF0rnRsQKw9rq3n4tBQzLoVc3Td6nuSQ+1U4m7pdULCVNltq+HLLIDe0REaogi9nM8s5uT
 SEy0jyEK3vszBAdzpu8ix9FOhqQrhcZFOzh9Rp8BTkBU5kpgy4VZdetORrFZT2AoXzfFneDbJwp
 D3TYzzvLXdPlDpG0h21w5PMTel/o1V5Atf8dU0ENPTw+AKFGwuJBygw5EP6VYNqiC2yOFvPJyQj
 FaJfdQeRPmcMqFTJp/T6dEWvXuDZYOpuOJRtAJEmeO+pifmHuZfDDe/xQ5UZNazkwEqLkCU6DSu
 DnPwqg/N2zb0AUw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

We have to wait at least the minimium time for the watchdog window
(TWDMIN) before writings to the wdt register after the
watchdog is activated.
Otherwise the chip will assert TWD_ERROR and power down to reset mode.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/watchdog/da9052_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/da9052_wdt.c b/drivers/watchdog/da9052_wdt.c
index 90b620b11b5fb634372e18ce4c40568cd946f284..b46338061e7d269adec691f8e88e650e1e2fbfc9 100644
--- a/drivers/watchdog/da9052_wdt.c
+++ b/drivers/watchdog/da9052_wdt.c
@@ -180,6 +180,7 @@ static int da9052_wdt_probe(struct platform_device *pdev)
 	da9052_wdt = &driver_data->wdt;
 
 	da9052_wdt->timeout = DA9052_DEF_TIMEOUT;
+	da9052_wdt->min_hw_heartbeat_ms = DA9052_TWDMIN;
 	da9052_wdt->info = &da9052_wdt_info;
 	da9052_wdt->ops = &da9052_wdt_ops;
 	da9052_wdt->parent = dev;

-- 
2.48.1


