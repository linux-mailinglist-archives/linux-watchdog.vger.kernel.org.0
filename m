Return-Path: <linux-watchdog+bounces-687-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CDC85AD5E
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Feb 2024 21:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE801F250EF
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Feb 2024 20:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832A92D605;
	Mon, 19 Feb 2024 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OY5EOPbk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE754BE9
	for <linux-watchdog@vger.kernel.org>; Mon, 19 Feb 2024 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708375366; cv=none; b=aipUYRwuw22g+Bqqf1TJZCRHMS7/gr+ebrN1wjwl+hvbG02JBQyayj9w+TUmdyE/g7anW7POuhf+FdAwzMm/ACi9P+iDX31BXA7qfJGSUTOfAC/8sV1qjttCO9/ZQsf537HW5/h//4ZWYubhQ0nqhKm6KYYKded5HhdhDLfgqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708375366; c=relaxed/simple;
	bh=LWYoqcpyK8X4VPXSuXdScQsKxX8vC+utoyRq4xupHjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WIfPEpAFrmObnQa8nE0ajiaZVEOa0Z60gjfgxeUq7V/b3tGDBqB7/vA+rJkvrQi18zUWEJmzo9pmhsiIMrOCPpSO8IaAGQoynfm+RFbEA5fIEKLIDfCPQW9GLmbDq9GtJD3hgjanfmbFZ65wCGLb7blUypTdPNC/QKvYvI9+OrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OY5EOPbk; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33d36736d4eso1417469f8f.1
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Feb 2024 12:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708375363; x=1708980163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERoEI/NO8GsC7AqMmtpwujEtptTiedrdKCGQP6wCaeg=;
        b=OY5EOPbk1y0jTPRrVzk0v8ud5V2isQONB+xXFIe6rnLdef1i9mKNu+eLHJwIYmIk6X
         GDd3ffLCBKdHGDXRmkj3pTbev9PVKygipki3ZgGzln98T3vxp5JWk8d3Ps2YwTtueUCw
         W70c8CatmvSkwPZamfGLiOf0Jx4MpzB+8Q3tYg1ETXaiN68SfGuGWUMjy1nNRYNrI+Cc
         ldHgMhsjQBJq35K19k0zfoI5emq/oOdN4Ui7Z8BZr7OgpwSWVE/q95yqSrMBH5G5pOFA
         gau9/raeXnHsmQqZzjrQIwzKBe3TOUfySiciOu+CNrONrNJAyKZTx7N+TXQXkcXIKhQy
         gYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708375363; x=1708980163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERoEI/NO8GsC7AqMmtpwujEtptTiedrdKCGQP6wCaeg=;
        b=n5MPbK8DzJikCFnvOewevhKS4qxXf+Y6Drd4AnPB5yoES8NxYgKCVqzx8vIQkQFxr4
         njjMkPt4Obb0rCQkUe9R67+GVtJrVsWRXH4wbqsouCstaX4NvrM1QmxfVsk44kOFne7D
         SGRsbkvoJLhy9YPkZosL1yar7vYb4+7w7kbp3TkOwDPAedJpKy84Owq2PsjBrjDtzrGQ
         T2ZVaqfW964e4Usfn4X5dtSk5wnKieIJQ9L6A8iezxtBMMauLzdTrWFC5qSPuzdKOkcz
         Ux4xmd5nmCqF2OIASt8tzx56OLdZ8O9OvXEYh2mCY229eaYiayKI0WdP2EjlNRkpSliv
         pS8w==
X-Forwarded-Encrypted: i=1; AJvYcCU5NCb1KsUTpHYm/znQr7dpolcaSl84KeiJ8wLINjh4WjHzoyl1d8Uu8d1o9axxOwTw9WGDrfHotcMztfc7FfW5HMjA4B85N8JuGu0OD+o=
X-Gm-Message-State: AOJu0Yw8pRhHAdfNmY8/fbFOFF+xaeDwZNPQddxkTqoFyPnE8Ng0KPKk
	ZiO0nnoEOIWkp7LLtKomhMf3fPSBlISS33Ag2XJMam8qvX8/sfv/5mYyDfjeYec=
X-Google-Smtp-Source: AGHT+IHjYYqpFzy+A3s2vMSjtgnWhnkjzjVccOtu/hMYrbwPJtVzvye2GGPfVXk3FAFAnD1YkEj4Rg==
X-Received: by 2002:adf:ecd1:0:b0:33d:22f4:75d5 with SMTP id s17-20020adfecd1000000b0033d22f475d5mr5374456wro.12.1708375362796;
        Mon, 19 Feb 2024 12:42:42 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-74-232.as13285.net. [92.18.74.232])
        by smtp.gmail.com with ESMTPSA id bx15-20020a5d5b0f000000b0033d202abf01sm10561000wrb.28.2024.02.19.12.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 12:42:42 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: alexey.klimov@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v5 0/2] Add regmap support to exynos-pmu for protected PMU regs
Date: Mon, 19 Feb 2024 20:42:36 +0000
Message-ID: <20240219204238.356942-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is a v5 of the series to add support for protected PMU registers found
on gs101 and derivative SoCs. In v2 and later it was re-worked to be based
on a regmap abstraction that I think leads to a much neater overall
solution.

The advantage of the regmap abstraction is that most leaf drivers that
read/write PMU registers need minimal changes.

Example of Exynos drivers that require PMU register access are:
* watchdog
* usb phy
* mipi phy
* ufs phy

This series has been tested on Pixel 6 Oriole / gs101 (by me), exynos850
(by Sam) and odroid xu3 (exynos 5422) by Alexey. That confirms that both
the regmap mmio parts and regmap SMC parts are working correctly.

The expectation is this series would be merged via Krzysztofs Samsung Exynos
tree.

regards,

Peter

Changes since v4:
 - Use same argument names as in struct regmap_config
 - Remove inline keyword and rely on compiler
 - Update kerneldoc wording
 - property -> propname argument rename
 - reverse Xmas tree
 - Only call of_node_put() when of_parse_phandle() is called
 - Collect tags

Changes since v3:
 - Fix PMUALIVE_MASK
 - Add TENSOR_ prefix
 - clear SET_BITS bits on each loop iteration
 - change set_bit to set_bits func name
 - Fix some alignment
 - Add missing return on dev_err_probe
 - Reduce indentation in loop

Changes since v2
 - Add select REGMAP to Kconfig
 - Add constant for SET/CLEAR bits
 - Replace kerneldoc with one line comment
 - Fix kerneldoc for EXPORT_SYMBOL_GPL funcs
 - remove superflous extern keyword
 - dev_err_probe() on probe error
 - shorten regmcfg name
 - no compatibles inside probe, use match data
 - don't mix declarations with/without initializations
 - tensor_sec_reg_read() use mmio to avoid access restrictions
 - Collect up Reviewed-by
 - const for regmap_config structs

Changes since v1:
 - Refactor to use custom regmap to abstract SMC register access (Sam / Guenter)
 - Add deferred probing support (Saravana / Krzysztof)

v4 lore: https://lore.kernel.org/all/20240208161700.268570-1-peter.griffin@linaro.org/
v3 lore: https://lore.kernel.org/all/20240202145731.4082033-1-peter.griffin@linaro.org/
v2 lore: https://lore.kernel.org/lkml/20240129211912.3068411-1-peter.griffin@linaro.org/
v1 lore: https://lore.kernel.org/all/20240122225710.1952066-1-peter.griffin@linaro.org/

Peter Griffin (2):
  soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU
    regs
  watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU
    regs

 drivers/soc/samsung/Kconfig            |   1 +
 drivers/soc/samsung/exynos-pmu.c       | 235 ++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h       |   1 +
 drivers/watchdog/Kconfig               |   1 -
 drivers/watchdog/s3c2410_wdt.c         |   8 +-
 include/linux/soc/samsung/exynos-pmu.h |  11 +-
 6 files changed, 249 insertions(+), 8 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog


