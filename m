Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09E1390927
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 20:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhEYSq1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 14:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhEYSq1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 14:46:27 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD64CC061574;
        Tue, 25 May 2021 11:44:55 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x7so13678659wrt.12;
        Tue, 25 May 2021 11:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ETyPODezt/BT+7eytY7KIt1vI3zH11qBx7Pvc4LY8I=;
        b=beWMe2khK2hYJAHtJjGIlotpppTCrnS3goc2nSVR/MQfOYU2e4BTlY5LlEzLy8DZHz
         O0VEDgCsD+0DzapBGioCq8wB3CDCS6S0WDFBJ+JVHKqZz0tB9DXp9YqmjL8oqHVYEY9S
         CfOPOQ/qO9WYF77CTlCgpnGH5+0eLcxRKnJZbydMyvmiHnC9aBtYC55IiFJLGBLBFaAs
         yq5CQdXIqiwhXUelELhdfZv7K4+3PBRPRdAGs9UM9GlvnZZ76JZtrTpUwizZnyLVUebX
         NbnizQQNDjVHfGb7Ycfik0VQkNRILNIwrDN8kqrW70w2zy6vZccfK06x7wXJyXZ9fscU
         NSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/ETyPODezt/BT+7eytY7KIt1vI3zH11qBx7Pvc4LY8I=;
        b=sK0v2Nchl2q5W9xwhw+MKZ1bMsFfdI5/2rC6YhlLYyfb/sP7lvqh4j65CY5lamw0/N
         QhGrPiNSHAT8cdxYbNcmu2oMBQnJn3giadWnZ0v3N6I48vSZqjaiiMY/eWaWt1cU0ZGZ
         x38APNgt0/CSwF68nKPLCem4/DIkPCxEWJ7e49utIPXSrqHQ6T9Y68uV0qqjdzRQvvsC
         TXMQ7OIFLOBxTocPMITCI9dwqn09T3BI+eAuTs4uRI+6Ok9Jpf6X7/HpF5PVQUnIY76U
         FtqzHbb9mWAry1kWUhXLR6ygL9tnM5MGdjQpZBXBcdxaqqImbsRGzFYOcllRnfiviewZ
         T9sQ==
X-Gm-Message-State: AOAM530EO4bDrGu+Q5qh/IOI4k6WCLU2EAz3erhhAJ+2x8hRJ6NuTanW
        LBHhJgX1Rving13cZM1zibxw0/o7oOI=
X-Google-Smtp-Source: ABdhPJxHXwoB1KsnXg6zXiyjf/FwniBEVpfXI0N1r9aC/lZdMEtRW8r1GvLhr/82DoHdIIhGIWswdQ==
X-Received: by 2002:a5d:568c:: with SMTP id f12mr30002231wrv.382.1621968294202;
        Tue, 25 May 2021 11:44:54 -0700 (PDT)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id r5sm16905332wrw.96.2021.05.25.11.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 11:44:53 -0700 (PDT)
From:   Romain Perier <romain.perier@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add watchdog for Mstar SoCs
Date:   Tue, 25 May 2021 20:44:46 +0200
Message-Id: <20210525184449.57703-1-romain.perier@gmail.com>
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

Daniel Palmer (1):
  watchdog: Add Mstar MSC313e WDT driver

Romain Perier (2):
  Documentation: watchdog: Add Mstar MSC313e WDT devicetree bindings
    documentation
  ARM: dts: mstar: Add watchdog device_node definition

 .../bindings/watchdog/msc313e-wdt.yaml        |  40 ++++
 MAINTAINERS                                   |   1 +
 arch/arm/boot/dts/mstar-v7.dtsi               |  14 ++
 drivers/watchdog/Kconfig                      |  13 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/msc313e_wdt.c                | 173 ++++++++++++++++++
 6 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/msc313e-wdt.yaml
 create mode 100644 drivers/watchdog/msc313e_wdt.c

-- 
2.30.2

