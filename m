Return-Path: <linux-watchdog+bounces-3921-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABEB150A5
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 18:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BF5C7A9B30
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Jul 2025 15:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D0129A31C;
	Tue, 29 Jul 2025 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8ZBkVJD"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080232980AA;
	Tue, 29 Jul 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753804771; cv=none; b=B9dE7Dk/RqjWYtIMCmZbmHH2/DZ1oXvWTCrFGnfKLEZcTwTsdOlfsuZ2UeQEHYz+NUW8bGMNxARv9QDxnKCPFtGYq/TqXHJIEFXANGcEMl0RmXAr1A/WCGHbJ+mTGMzOOhblOkgtYpS/wJldBBgIa4O/h6HdKS8tEFoXnb57sBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753804771; c=relaxed/simple;
	bh=B9nYNI6c2ACO6k9bgYDZjFYHBSnoN0q5cwqet5trxQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQkdUSOv/PVPJVrkg74kBbTjcKdfpdiZbXZJMLCephnsuUIDoGeUft9xQjRr4o7SJA8cJLUCAfK6ffJAq3uYqPve/ogVvNrdQYomv8fMrarRI6ls7PI9ZCVsg/3uFLdoERbCRDf/AwsIJoAe7GjhrYWzSB2XlCSaTj3tM2MvwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8ZBkVJD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45892deb246so304285e9.2;
        Tue, 29 Jul 2025 08:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753804768; x=1754409568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtM4I8vtWLcn3/TM2qsvlWpnIy4QIgNAoMQTGdyCT1o=;
        b=P8ZBkVJDbFREBAz5IuVnzbIIP/FWliRXIZKpE2xsXT26xyEHoK7ylFctV/awWtW5f+
         SaGoYfT02q2aS5q5XcDphsWp0D2E47R/hVizAR2HshhpDXkoUNtpdu54W4CVJaCLMCfq
         NPNJcPU3/U9GAIyuVatY69Z3zIZpM/URjPROTwarmFKVR+zq8um9eGtp5GUfDSrsbz6F
         /p1ES36uyXwqF3dzGQAml4owc3ixiGa9KF2H2USeqGEVtIe5Ef8IvDp7TblAD8+s4x3O
         kG36+l5A6I7ofSxwo1XfD9YxoXJ3ClHF6ILIb2yR7ow98shpCKE0g1ciYzodgelSbKdY
         Y7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753804768; x=1754409568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtM4I8vtWLcn3/TM2qsvlWpnIy4QIgNAoMQTGdyCT1o=;
        b=eBMHHOMAUS1i9qWF5dXHKy2ffwgloWoaKms2DNWQnTRmaxymMMT4Z2D+P0lFuu8+9l
         7OOmer3k5ZX/yxQxjgVOHvkw9ydn10ZVmIrxDvbSmShugVM0qWy/wEMwb9aaZpSEdFZr
         EvXQ7sBhrGhyx92bVC1JycnNw+Bpy1ke4oXCib5hVXeJzUwaDv55H06GdkHWG+rwWuVm
         69uqAwEpvpTrua3F0RR2fqCKOwFCCp7pj5jAgQWeD86PaAU8wAg1ffyrkaFk7TecHWlU
         Rnw918oy+sQZa8a9RIwpi5P+N6Pjbf8tEnlTzBxL8uFfyPo58Ve8J01v1buIUlcrGfem
         4OSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/fDDNL3WHyMsQFKmkTZnMSXvEajJhdYsCJBTQlEQ8bNH9vbsCvIfIrOa0v/3IgLUBXhLAV/IuSB3UU5Tu@vger.kernel.org, AJvYcCXBY7X4I0d31xm4UTX0Lz0m26anmFQ17Ph9fI1n4pmaYxzOpjhOi8BXd6I8yN++yPc/xZ0WT1CwZHIhXuids15F0b0=@vger.kernel.org, AJvYcCXV3p5Dc/XKkj0f047rxIdlkWQKZafBxTpc1lLyMjyZxnK11LWfFNHD6XVTzeJ7s7lqvMQgUm3/4Ovs@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyQ25uZqf9NrLdA0xq7c+1t/aIu3tSmQ37ob+p6WZi1pWA+id
	cfFyTgw4+TIWr+3A8Lf2Vvom68iSaK/m4L+2uVBSGVFqRbt6rUGtnR9+
X-Gm-Gg: ASbGncu63XNyaZ3kHH6lfCCRYTrKbDEGQGmGT46dURZuu8VFYZnKAKXw7WQXtZSMLXX
	sAcg6JS8wDyYaGMTKffJf2Hbmza6yJKvqyiSuUQP+Cz52cam8WXFbPMFVNQVI8jbcHdoNRorPoO
	nGhxfxYdte26sELO5Yo00igB1VE0vGZk14iiLgydNlh9ur9izbLvA9/6bbVudb4TuyV0QamTvdp
	vctCicJjRSVawmvHr/j2HhC0YwNPxw7XjP0Tv5wXHMZyC5oW7xiV0AxjAwiciRNk0tCj/A1WJU9
	9B1Wclzu4HrS7xmpTni8VfRdPqq+CLvZ26ZD8ja+u8demZaJFXTGcfAO+juJVjI1pVq5Kbfmhsi
	PxPDOGzkpDJypAQou419NvuMwjlHbpQrE8t4eFqaAo0PIdkiF12FRGRMMbs8l9BK/A2yAYgmAHg
	==
X-Google-Smtp-Source: AGHT+IGgWDkcvx0MdeWGngpNkx1ITjRfpN+0b4px8SS+RoH/y4uMnX0szz3DWQztXayNGe3W/sFuBQ==
X-Received: by 2002:a05:600c:1d19:b0:456:18f3:b951 with SMTP id 5b1f17b1804b1-45892ba16b5mr3251785e9.15.1753804767883;
        Tue, 29 Jul 2025 08:59:27 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78a9d3d03sm6062509f8f.2.2025.07.29.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 08:59:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/9] watchdog: rzv2h_wdt: Make reset controller optional
Date: Tue, 29 Jul 2025 16:59:12 +0100
Message-ID: <20250729155915.67758-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250729155915.67758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use devm_reset_control_get_optional_exclusive() instead of
devm_reset_control_get_exclusive() to allow the driver to operate
on platforms where a reset controller is not present.

This change is in preparation for supporting the RZ/T2H SoC, which
does not have reset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes.
---
 drivers/watchdog/rzv2h_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index cb584ac5860f..f0e2bf786acc 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -240,7 +240,7 @@ static int rzv2h_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->oscclk))
 		return dev_err_probe(dev, PTR_ERR(priv->oscclk), "no oscclk");
 
-	priv->rstc = devm_reset_control_get_exclusive(dev, NULL);
+	priv->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(priv->rstc))
 		return dev_err_probe(dev, PTR_ERR(priv->rstc),
 				     "failed to get cpg reset");
-- 
2.50.1


