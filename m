Return-Path: <linux-watchdog+bounces-465-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B5E8376DC
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 23:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B28FE287CE6
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 22:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5131D4B5D8;
	Mon, 22 Jan 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PqEfn9aQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E24A9BC
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964261; cv=none; b=MFmae5IhXTRsU2qRK5e/MzMOfSoKZEHChqby33j4xjyiPmgO7UIUfNqVM58K/r2oyvAcirinZBLNrHr+kF9gypc1khN56bc2okNQEtXeBVP1vFVcDm3rs1DnjY6FmokuqFa+G0KOV7k2pEIa4BqATl/pLlrgvrU2y4LXuuplezk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964261; c=relaxed/simple;
	bh=t8ZhB9Hu7K4Ql69piBPtPrEhaMrRJa2GJ7YXvafwt4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kUKfsSeUzCuZ93SWpNlVy8W7sX+EupVfGTjTiywDipwZnPjPFeN8Gns8E6kKgJ5/L9tDbDmRstYt5bsAeMNIMcTZ0D2JF3PxM7C0wSOjXy9bUSUrkUJkOTn/uXdo2SNC/2zqKWOELgrs10YqcYCOWSXF1Ja5hr/JsCFh97q1Ixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PqEfn9aQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40ea5654271so26721235e9.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 14:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964258; x=1706569058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+yXcHZUiMblwUqkt8towiLq/bcfaAns/f7tUicypCM=;
        b=PqEfn9aQMDjMpVjxcwU3m06SInZctx95KFmBTKBsntncoscyHDc2lliCVayNpxOYQQ
         SnUEnO6h/F9bl26o4vmJUAbbewhFPTnJ5YybFJYUC83L0RUIswVo3MBNhhYt/fWyPlL+
         HcyAhfzlNdTng9JeUiraWKSWJ1tbi//VRhnXxGc773QVcIxczQKJuHQfD/BgjGgnKMcn
         uVAYpVymfpBIRn5Kj6bbwowYemvkNzgaiRuzl0X/iJGbjrBN3ls8xOXcmIk60hgX/Eyq
         vB1sp/akhwPkY5bKsuA8zxAyxlqgLRbRFPIpHA6duuUl1Yw0vr24hJA86lbWCcxX90Wo
         lrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964258; x=1706569058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+yXcHZUiMblwUqkt8towiLq/bcfaAns/f7tUicypCM=;
        b=mmni/FNzxOemAenTqXHr95UPn7dzKhNYY5rmEdbqOfGMPehc22F5jyyIdCRyHT45xT
         01Rfw3TmnWEQvDhuPw+MLRjB5CxuwZVZaaStOpoYdG9NxFGn4OKumKwHFrShNLrdod7Y
         36reOYHcnbFvxZq+pJ3WGT1bNdzIwU2vLyC3VTAbjbRXk8bMBAWD+MKDHB51Rq1nYcnY
         2bM1Txwft16JrghZDDUyBMLS7PkUpoLZyy0HwmAuH6mko3V8VlbxXSQJJ9YAEc0bR1ot
         ZvKl7tX+N+ktRv8b0Q/CJYWtUlCSiQ3SizommwyLroFHtn3TA52UOKpm7VqV+Cxglnc4
         zSCA==
X-Gm-Message-State: AOJu0Yzw6jG+CUmcHw816UgQLewsnOhxlJWnbejIYbPbPlSvATmmHIgl
	H/hSlLOUSTTZf5gbR16HrzJiBsqlLeRDduoZ1UBRElUslHBnntT5E0TyTfraLOU=
X-Google-Smtp-Source: AGHT+IGTxTra3oeT53FfIH97Y2Gx41002Oxx5G+brDmtK77zTRluoeyF5o89lKBl/s6gRCsv7yvONw==
X-Received: by 2002:a05:600c:1ca6:b0:40e:b0a1:b96e with SMTP id k38-20020a05600c1ca600b0040eb0a1b96emr676113wms.69.1705964258092;
        Mon, 22 Jan 2024 14:57:38 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:37 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
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
Subject: [PATCH 8/9] ARM: dts: samsung: exynos4: remove deprecated samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:09 +0000
Message-ID: <20240122225710.1952066-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung,syscon-phandle is no longer used by the Samsung watchdog driver
to access PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos4x12.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4x12.dtsi b/arch/arm/boot/dts/samsung/exynos4x12.dtsi
index b4b5e769145b..0fea32616c89 100644
--- a/arch/arm/boot/dts/samsung/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4x12.dtsi
@@ -311,7 +311,6 @@ watchdog: watchdog@10060000 {
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_WDT>;
 			clock-names = "watchdog";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 		};
 
 		adc: adc@126c0000 {
-- 
2.43.0.429.g432eaa2c6b-goog


