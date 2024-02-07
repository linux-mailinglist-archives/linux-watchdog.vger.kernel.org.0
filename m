Return-Path: <linux-watchdog+bounces-608-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461C84CB04
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 14:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4E11F25147
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Feb 2024 13:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4167E76C71;
	Wed,  7 Feb 2024 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Cph3DwTB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A976C6B
	for <linux-watchdog@vger.kernel.org>; Wed,  7 Feb 2024 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707311279; cv=none; b=K++r/UYP955lepkz2U+2PYfWhFPyY7fA9f5iav00dCQlaoWcmP7oeqjWklG1bY6bsnx5OM7eTa6dRNjA1EprQv62wCPac2EipRW6mPwczR6oaTg3sOkY5G8gJZOyMpQkh5JrY+jJRiWxbou36BLx5RPlfYUC7You2ipAy8lXYWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707311279; c=relaxed/simple;
	bh=cnUYyVs5/vC7vebIv9+mS88wVxIV0SdJzuzMN/NHZ3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G4qVXXJTauJTx2t3CITd2H11dQhN+eqJ8rHwnjZmPD5OiXeq9IIs58hfU/wjIvYMxNPvcF0xTMPuaMLr74TKPFIpgLLtw3oLRjMLDdquMEBxLgS8uSUi1ncgj6itvtEHVCYbk+RG1Gd0lxx5KJ1sDgnCTrbDqR7Ihuh+vDeNUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Cph3DwTB; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6e12b917df2so328780a34.1
        for <linux-watchdog@vger.kernel.org>; Wed, 07 Feb 2024 05:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707311275; x=1707916075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgZxjoWrT1AZAxZIzQbeXNN5B4NUExBzEhcUQwx7T6M=;
        b=Cph3DwTBukllsxqRfOjoNMLbVy+BrSiWUJHXNm/MMVC0N1x+1qhe/TAPddTvp6MPVB
         UcV1MIYys+ueNkCO+9cRvtUqdRFJhKaudl++opXhKButacdjpkilsSQic1Y0TI01XWkx
         019IK3QxZp8IoCTAmg23XmUnbHpBhhXAUwUNSot0Pt6ZSUze2Z/+AJrtCg6hUgR/ufzs
         UI0c6THi+8YKg7QD0XWqwwTZ1ojJRcaDGcHZHgnU9D9AYeKfriwjjDiGTdPxWEP/xGqh
         uKP8pChyuAOVvf3hrLjc32p4VSXMeAJV9SKHvy8S27GknQeEnBmQ+Xhzvq6MIYW45L3j
         2XTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311275; x=1707916075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgZxjoWrT1AZAxZIzQbeXNN5B4NUExBzEhcUQwx7T6M=;
        b=bP+mRq1esFvRnx92MnyjxMgLBs3fl7np3RRsO7XFoU/fZ25W+NECknoNsnbdmbbFmn
         ixBii4ZEXpCVX1oVpYl1JWA2EKDIOyadY1TiG2RyllF9jr+c6p4POG6IVrA+VYFMypWs
         2jSfC/RmM9R0T408kUTwYl/12DmCKCBychzGPnOFgeTjXK2QHysAVEN3BFqqe+9JJ03I
         zwq+zwSJtw2a6n81NCi0t1ILGjZ49k2MS9BrpXOiLHvn1cPEXSOPThG9mSFA7kDthdDw
         WXVeDl5mrRMXor3P7Q1eeuwInUIpbZAoFfX9wd0QMVfmmUDx6A/71QM8BgPG5L8Ij8YD
         5k1A==
X-Gm-Message-State: AOJu0YznPOJ64aA05BTxUS8z0lvp6AKixhGqjHFvdxFQV5/bdSpmnOAw
	eAF1oPDUW7Sgb95XGkzCer7ou0ZQYtOVSEFpD/0F5Rs8AQZmVoZiFtFH7G21u9k=
X-Google-Smtp-Source: AGHT+IGN3NF79eAyEr+25oA68ij44eKtiXaEuQSz0jscK3NPCNE+n65Z6eFMP6e1JcIgHQCGfmqIqg==
X-Received: by 2002:a05:6830:3a88:b0:6dd:cd73:3b0e with SMTP id dj8-20020a0568303a8800b006ddcd733b0emr5678654otb.23.1707311275538;
        Wed, 07 Feb 2024 05:07:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXqCDZDDBRDbsXqT1ey9HzXOkExZvunGlbVwR85X02+RML9qzTmXaasE8bMz95+CJqyJuDdjUU7X9NSSdPFs6u4B/AWUp18Ziek6W7WmFahz/Y9bhmywcXigdcQK83JMVOzlxD38ThZFceT/k9sH93EMJoRlvnvVWB3K1aWSCPFXiKEpycfUvxXwG/G5g1zrMmqlGL8m4vcyxsnr33K8BtM+ftBrAq9mSnC013gk1IuqVTZ7uUhYiJzKAgOQZEs5/cflyl7YXklzWZBHyV7SrJ1oZ2jC5GXiW/2Bf8r3uFhFHx306TyTLk39IaICzhaPsn+9KsbeZeITYVJGNLZ8tQuzS2PsEbC1nrFqoMMq/vnDFChRJrtfcKLgKAa7qod/Xy5uJ8J3+/Ti9VP+lhyS2U6BBOgmp/wDHtwNQMPF4gd36FdVc1ZYU6gdfdp/cdeuFZxrcpJrwpZTQ0JrBnrbqADrEKLaf5wFOklZB5ggDQITRmhYutPfPuWHFp8vYvumvsmI3nODM3r3Q==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ca991000000b0068c9cd2cf88sm565455qvb.60.2024.02.07.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 05:07:55 -0800 (PST)
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
Subject: [PATCH v5 0/9] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Wed,  7 Feb 2024 15:07:36 +0200
Message-Id: <20240207130745.1783198-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/9 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
- patch 2/9 makes the driver depend on PM
- patches 3-7/9 adds fixes and cleanups for the watchdog driver
- patch 8/9 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/9 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v5:
- updated description of patch 2/9
- simplify the code in patch 2/9 by using on a new line:
  depends on PM || COMPILE_TEST

Changes in v4:
- added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
  ARCH_R9A09G011"
- collected tags

Changes in v3:
- make driver depend on PM not select it
- drop patches already accepted (patches 1, 10, 11 from v2)
- re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags

Claudiu Beznea (9):
  watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
    ARCH_R9A09G011
  watchdog: rzg2l_wdt: Make the driver depend on PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   3 +-
 drivers/watchdog/rzg2l_wdt.c                  | 111 ++++++++++--------
 3 files changed, 64 insertions(+), 51 deletions(-)

-- 
2.39.2


