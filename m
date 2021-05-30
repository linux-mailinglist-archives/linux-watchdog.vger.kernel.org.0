Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F52394FF2
	for <lists+linux-watchdog@lfdr.de>; Sun, 30 May 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhE3H2s (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 30 May 2021 03:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhE3H2q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 30 May 2021 03:28:46 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BCDC06174A;
        Sun, 30 May 2021 00:27:08 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id g17so7462655wrs.13;
        Sun, 30 May 2021 00:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+tVxOYtByP+ndj4vQlqR1yZg+LmRS1nMw/pCh6v4Xw=;
        b=RrzxUy6Qb5Q0ZZthV/S6OzS3s+/wl4k/zDfVUHsj/iazi823fBgQr3fqe0f6zPQRZ4
         VWiObSAdCwh9AswfmC+mK5XHgZqdO0jrFZdeaSRgnrpz5D/Ns+0nNdnY+KSEkOO9nLHU
         O6jPqxXSFEk3u4PU+XQsfEqbiL4fkQWZDDUrR9IoDPJ1Neq7++SDFhzJVWjdy8xzcbg2
         4OT4Vz5D7czS7EW8KBGFdAybKVjOkRWF69Cw88Ho2van5LvFb8IfJV9PgnjNAnTXgU/n
         NwjIkcu8N34b9144wb7TAudilm5MP54jk31Dj4zOgcMt+EiiTtd6r/45pxbarZSK1iMw
         axdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+tVxOYtByP+ndj4vQlqR1yZg+LmRS1nMw/pCh6v4Xw=;
        b=SkBK9nXucWHVih5SQjtPZfHHT2Dz9n/FCbWqWT4kkaMuJoEReXQRd/ZGp3wDX9lTSO
         VJ/tEPME90bbbeSpXSkPOo5geCK8UfpGoyrnZFLvte8o9yvjgLsgU/NLEeIU6NoRYCxB
         1tfDdR3BUNU3dXV/UIRu2gRdISVfpHzD/4sPXTTGTHe3THn2MgiM6482R65A9rI3nMmS
         Mo8N7XCYD0D2EGMZGxM5Hjqmye0qlKBEWc2NLES5c+j921614fXHS1CMqTy5EkSqAdOL
         2Bn4/cGF1wPInx0DVTpcL6alyMU/BUC7essIiyLlmM+VM/j+Om/PR3DL7OjzaKCwcIBV
         piKA==
X-Gm-Message-State: AOAM532lfSaXqQIcnEgyoC0MtHDSQ3mo7VZekf5hNmL3N2nGp76fgLE7
        7dZix11lcLoCNOEb/fNuERihpUFiyvYT1g==
X-Google-Smtp-Source: ABdhPJxqTI6C9nPfZKNb5HL+zD7FQJTLSPwSIKMaSUmBpukJED4EMX0ve01kmkawxCmdvSgh02NByw==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr2155482wrv.165.1622359624403;
        Sun, 30 May 2021 00:27:04 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id r4sm13515059wre.84.2021.05.30.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 00:27:03 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add watchdog for Mstar SoCs
Date:   Sun, 30 May 2021 09:26:42 +0200
Message-Id: <20210530072645.10379-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patches series adds a new driver for the watchdog found in the Mstar
MSC313e SoCs and newer. It adds a basic watchdog driver, the
corresponding devicetree bindings and its documentation.

This work has been co-developed with Daniel Palmer.

Changes since v1:
- Dropped "depends OF" from Kconfig (not required)
- Dropped unneeded include files
- Re-ordered include files
- Compute timeout_max dynamically from the probe function to avoid
  an overflow in _start().


Daniel Palmer (1):
  watchdog: Add Mstar MSC313e WDT driver

Romain Perier (2):
  Documentation: watchdog: Add Mstar MSC313e WDT devicetree bindings
    documentation
  ARM: dts: mstar: Add watchdog device_node definition

 .../bindings/watchdog/msc313e-wdt.yaml        |  40 +++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  14 ++
 drivers/watchdog/Kconfig                      |  12 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/msc313e_wdt.c                | 166 ++++++++++++++++++
 6 files changed, 234 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
 create mode 100644 drivers/watchdog/msc313e_wdt.c

-- 
2.30.2

