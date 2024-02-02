Return-Path: <linux-watchdog+bounces-580-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D06847261
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 15:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581FA1C20F08
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 14:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD5E144612;
	Fri,  2 Feb 2024 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HXlVuTVW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01F1420D2
	for <linux-watchdog@vger.kernel.org>; Fri,  2 Feb 2024 14:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706885865; cv=none; b=WdojN2rIlyFdT6dQxatZnxu0CN/dcjEMMBdJgzphP+XDjpmJ7Ugv7lp5Jy/9cv9JLft6WriSRN+KxZdaTEkmZHhOvusq9MpF/eSlipfkWH0r3ytJINs5v+T0fh/WPYxMCI98Obni7PUaEVg+ErrAq1UsoeqcA6L3rpnnynKbFQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706885865; c=relaxed/simple;
	bh=1lr2rBMrd5PP9mf2/qYecMEIsW1HFWq9nzMWPG42CwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p2xOzSrOFRaFKUCSp/7ud15oCA63Evi335IdoCvBvYxkTNZOnwWARDyi/HU+SVIyommyp7E4NitEoJ7uytaYTZDJ6fF4wKiIXfESrol1GzmXSl5QM2kpw5GNUFtaZidZG+50rvJbPkM8NIKhzy/DiCdlTKv8tuE0U0LhMpZsOsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HXlVuTVW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a354fc17f24so283650666b.0
        for <linux-watchdog@vger.kernel.org>; Fri, 02 Feb 2024 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706885861; x=1707490661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l52rEpkUwMDo2Zba4o6n3vS7Nj2bBzY4EMwlY5C0Lrw=;
        b=HXlVuTVWjOBipZFR6zrTdfrSzLGE/AX8072WeeE8sBmtc5tgrbFoEkgNvr69T6MOyP
         QU59ra1r3M/I2OcX99vE5AQLg8anWQIKq1oN8QteCz8WdwRAucvCuk9Ym7D1xJbz6LjL
         zzMSwElKHaUJXMSLjAQekGBqPUFipfByvsj/gv3nZEb97ISc/vU1QlgkzlHZoVrz/gYX
         Z09bshnKLo34HZgHhisW8ZxAdHj3YCE2CZcLqXAjz+ynKYQzxUOpaOGEqzpDkByxX3x5
         l5MMqxZc5FexLa3iH5N9IUoJbEnIboF0y1mgsM0v87vKNrbXOLMVA86DV4ffln2Mg7NV
         vdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706885861; x=1707490661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l52rEpkUwMDo2Zba4o6n3vS7Nj2bBzY4EMwlY5C0Lrw=;
        b=JdTlijisAERdivEHBOk5TnoxuJr6Tqk017hJnqEoiV0Z4wOy+28Yg7NcRWohuUpcXD
         T9Q9af4/weftK5ebcKhqXdDEkxHTjGf+uCzRtT0wQDgPsGJn+2zBJH140O2/3ZdOD0OO
         jHaTdG4OHRaul/jBoYjhHV7TUj9dn9Ysrn+PEB0cEWPqrZxe/kbLe2/Lq4EHsN8EML5g
         7bV1raT9Yr0RZkrJoD+W2jWvmoi9wq1r5J6F+qKWsDIO0d3PF4P2RBaRafVHzw6AFPzf
         gAvaMt4Z2dAm4tEMsA1yWTmqG65BnFbYopWeUPxL8eLMPpN55/9oYp/JAfS7ljChPR+F
         +gxw==
X-Gm-Message-State: AOJu0YwHRxFFY/+CWbBW3zrUHPvTvBqgwcWhmBgcLrGCxEMN4TBYfRgh
	PW0FcFkL+aS+PgETz/ITlFsfiXxr6b8ITZPiPwMjwVzo9qaRY2fl3FBdFwRcLN0=
X-Google-Smtp-Source: AGHT+IHEu+WRz2st0ESBNeC3bE/RmWl191TOnOii2JKPU1M/EGJJnhU1WgKnxBh3SyYSBjWm7TGUJg==
X-Received: by 2002:a17:906:e81:b0:a36:47fa:4b8c with SMTP id p1-20020a1709060e8100b00a3647fa4b8cmr3882383ejf.9.1706885861548;
        Fri, 02 Feb 2024 06:57:41 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW4Iv63M/sjFwyyZ1Yu7E+K3YAMIe1KCna8PUJk0ZmO0ce1i2Rn/R+uTov2FgTh8yK0bj2GwDkaEy7jlYd5Cnb1HeLqb1wJmaJfFsd0A6Vx5Q1TGqtTFKxcB6NJ78G9cOaMvk03bz0v73YDKz9cFnCNVPYU//cKkkpm1vCEQ18xTR5GV+bZTygz57akm1li4rjnGL+KiXmHhDcvqzB2vFnIk1VzxNVOyiFkgAaqQP7P/WkvvVfwOJSohxwL11G5hJUXv+SXZVHVYyZgDtLiKYJ/7myzmDUIVInFXWPXpLfb3AKmcesoVd36DVav68luW4IlngpXcYHek8+gkuIPc5Vjquok8g+DIRDmtDrRcBdeenBhmKAu39XVDFyb3Q6AyiXVZAzMSTRnz7u7kQgFVKDOxEmlnwslHEVW4b+T36YHoWTUTfljbNVUyWObqqZE8XlkgEsjRieRrAVKI1heQe09kB0KaE/Ty0VwvZXE3T7qvEQPrslhht2qF2QkPMiWCB8id731HiKTPpcFSq3J+LZh0JqkT744LAB6scIVn5HNHjOR1fGesgT60SDOtiq500F+18lwkgw0ysFpqQ3jEY3h62B9YC+kkY+aTKpBvVQppC3ohOZW3OCDM3AU4nfGm/ll2UVgWl/9hIex2gAYigTNeGlgzFNMjTQKe+PX1WSgYWNkA6Vdi6XIEMC4MWZWGRJX6+q6L8tjpw==
Received: from gpeter-l.lan (host-92-21-139-67.as13285.net. [92.21.139.67])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090616c800b00a36c60180aesm957200ejd.60.2024.02.02.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 06:57:40 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	krzysztof.kozlowski@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	alexey.klimov@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/2]  Add regmap support to exynos-pmu for protected PMU regs
Date: Fri,  2 Feb 2024 14:57:29 +0000
Message-ID: <20240202145731.4082033-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This is a v3 of the series to add support for protected PMU registers found
on gs101 and derivative SoCs. In v2 and later it was re-worked to be based on
a regmap abstraction that I think leads to a much neater overall solution.
The advantage of the regmap abstraction is that most leaf drivers that
read/write PMU registers need minimal changes.

Example of Exynos drivers that require PMU register access are:
* watchdog
* usb phy
* mipi phy
* ufs phy

This series has been tested on Pixel 6 / gs101. If the various maintainers/
contributors of other Exynos SoCs like exynos850, exynosautov9, exynos5422
etc can test these patches on your respective systems that would be most
appreciated!

The expectation is this series would be merged via Krzysztofs Samsung Exynos
tree.

regards,

Peter

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

v2 lore: https://lore.kernel.org/lkml/20240129211912.3068411-1-peter.griffin@linaro.org/
v1 lore: https://lore.kernel.org/all/20240122225710.1952066-1-peter.griffin@linaro.org/

Peter Griffin (2):
  soc: samsung: exynos-pmu: Add regmap support for SoCs that protect PMU
    regs
  watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU
    regs

 drivers/soc/samsung/Kconfig            |   1 +
 drivers/soc/samsung/exynos-pmu.c       | 233 ++++++++++++++++++++++++-
 drivers/soc/samsung/exynos-pmu.h       |   1 +
 drivers/watchdog/Kconfig               |   1 -
 drivers/watchdog/s3c2410_wdt.c         |   8 +-
 include/linux/soc/samsung/exynos-pmu.h |  11 +-
 6 files changed, 245 insertions(+), 10 deletions(-)

-- 
2.43.0.594.gd9cf4e227d-goog


