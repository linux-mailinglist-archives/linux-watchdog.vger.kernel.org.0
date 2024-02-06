Return-Path: <linux-watchdog+bounces-594-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF084AF42
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 08:52:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57D09284AA5
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 07:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9575439AD5;
	Tue,  6 Feb 2024 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OvbyAupr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DA12AAD6
	for <linux-watchdog@vger.kernel.org>; Tue,  6 Feb 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205932; cv=none; b=hKw1lcvsIyvkpsjvH0Cp6HqoMphtuVN0zYI63cLekGaHo6wcmBmn1vWLXWKXmWjZ2T0bb+otSRHQmZvOppL2qkuEGbBokPx92enY4Mbi2uT1jkfpyFOexdwtIPeLiZzWoXyeckvt5KLgqRUqscvEf1z2mkd1CVwzLrsQmvXQAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205932; c=relaxed/simple;
	bh=B7ZI2SD8d3W5zxWFuLoPUdZsUPHlZgyVmcI9/1dywKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ldT2tjWa5tqcJHGcPH+NgD+TOLmZNFHtydxQIDVkiy6vZqh2AQqieMPCVXD5dXmwmfDPqcoKu2xZVip5mxWkeMXpKsLgNrt/0S2Vp9Teg5t2RJprPg+8nEuiP+IEuYhbH/aZeq2gkSXG1ZRUE/PLIxU6JBXa5yTKjlCC6RR06KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OvbyAupr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40ef3f351d2so1258545e9.1
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Feb 2024 23:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205929; x=1707810729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntdF34/qM/GrD9bNmK0Jsu4ivGsCm/w2NOnD9IO/AYo=;
        b=OvbyAuprpVJCXudBf5e1lFbgf93J/44o60/LYZtlY0loiAT0GWZeH5gVJw41MPAAJp
         D81Q2boYZeoGkVBuWSj9X3nqWHJaTubCPZQA4d5W9q7EL/Jdz3UHJhq47iS4fetl2cHW
         u+LrjxK/Hb/Q7pqltMa5Gzr3Rk2nmKqRM8afDew6rJDlee/PW2LGW+l25Q9UChFUVIP+
         Hii5lIkRCvKPNUr6DrtmnUGgv7qoJVkiBYwtt7WrUxW8dmVhm1o0dmtORQCskV2Bz+ec
         Awag0lp083hqbk0JfgSA4mEsRdMo87wP8sdDO9LobOTY4MIo79FeoXqVBef4F6LVNGaN
         Wf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205929; x=1707810729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntdF34/qM/GrD9bNmK0Jsu4ivGsCm/w2NOnD9IO/AYo=;
        b=CiOzdjy8jZOuKcz1Xf3q4rOcO+8xfYqVQVZ+Yj9eMCqSuDloWc8pCPZ4ZRwQs7rHCH
         Qt9CO/VaLvKlRoSSH7/TlBSJQSM53G8h+XHWGhZRHDFxWpDKP2aEWnWy49UW5LoOpzfD
         Y8Ee99AuYOHVy44RAAiK69w5x2CyAGQZC2ql9pYQbKRXrNE4v65MsQ9HD9ei1NF4czYe
         D8fjqzBGYu3jsA33tjTyB+By8WPk6SY7HwdB4h3gkxcyUvd/yKDI8Q4u9FGqXom+dPEy
         +iLiz0B3PKAIv8ZeQXuvlp5SQR6k78n6v4V5/fu1+I6aLpF28Yn/5odiGy4UOCCNgXJZ
         qvew==
X-Gm-Message-State: AOJu0YwYFtAvwuo0LBh9CaBDnCxhlDo7g+y39xoV09WdBfEvHTxm5dyX
	cNOR0OlWTnmDvqIHy4W1Qg/R3idQBGNUlxvpHtpSLeNAjS8UumUibZxsMhXlN/A=
X-Google-Smtp-Source: AGHT+IFwz95g7UNrHEEzVRlmGAtfhFESJIN69PsnSGCtPPHYEKmRrs/SvIKSESYT496QzRpD8F2Lyg==
X-Received: by 2002:a05:600c:5116:b0:40f:dd0f:e7a5 with SMTP id o22-20020a05600c511600b0040fdd0fe7a5mr1451761wms.11.1707205929336;
        Mon, 05 Feb 2024 23:52:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3r8ZXyDBDwRKn/0GcTalVwfTDivewtn3VP+NJWfVcPsHXTiHxjkG/cNLNZfYH0yReTKMCS6272CmBry6K/5Hpmq6EW+mcE79JymttnE21NbTIsU250BcsM18j4fPu/xBU8IF/B1mwZ4uB4ep0SRJuGXxGJ0FBBnZGRsR4bYegXcUJqpPx52jVPrq2iSQYv4J25WXfw7OfkdGMiHm+uBC58RCYZkCGwmsOpjIpkNvBHeE0fhEeCXag3fnZ8Fl0vPWu6UkrAv06PIuBg84fH3k+BNahKyeZcEavGJw3d9vblsvJWBMwfTefl4LbcgmBh0U2t/zaP4TBuRbjHdCm53wuxnIs4gYTAhnWGlJcbynB4oXJ+sO40UP/RW91TiFbpQo7O0pjnws/Kin1knNJORSOUeo7VqXgrIN//hBpzlNHuMu1n5VezFSLF3qQNhBecWPBPbsP/R2tiqcUW/ISz2XpZlgGeGGM7dPNnFVnokOHW0jDN9JDp5zaW+RdrmlvgyTVoI+pkvlGOQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 2/9] watchdog: rzg2l_wdt: Make the driver depend on PM
Date: Tue,  6 Feb 2024 09:51:42 +0200
Message-Id: <20240206075149.864996-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The rzg2l_wdt watchdog driver cannot work w/o CONFIG_PM=y (e.g. the
clocks are enabled though pm_runtime_* specific APIs). To avoid building
a driver that don't work select CONFIG_PM.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- s/ARCH_RENESAS/ARCH_RZG2L || ARCH_R9A09G011 due to patch 1/9

Changes in v3:
- make driver depend on PM; with that the "unmet direct dependency"
  Reported-by: kernel test robot <lkp@intel.com>
  was also fixed
- adapt commit message

Changes in v2:
- this patch is new

 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index f6cb63a0d889..27e11ea7eeeb 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -910,7 +910,7 @@ config RENESAS_RZN1WDT
 
 config RENESAS_RZG2LWDT
 	tristate "Renesas RZ/G2L WDT Watchdog"
-	depends on ARCH_RZG2L || ARCH_R9A09G011 || COMPILE_TEST
+	depends on ((ARCH_RZG2L || ARCH_R9A09G011) && PM) || COMPILE_TEST
 	select WATCHDOG_CORE
 	help
 	  This driver adds watchdog support for the integrated watchdogs in the
-- 
2.39.2


