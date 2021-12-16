Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCAD477969
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Dec 2021 17:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhLPQkp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Dec 2021 11:40:45 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:43780
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233473AbhLPQkp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Dec 2021 11:40:45 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 04B1C409F7
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Dec 2021 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639672843;
        bh=wzGK8JrM0qK5K+9nNV1QJqS+dRB/4uLBgfT0d3ILjG4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=cQtlT3utN3EaG2IlL/0ZZOmZpSfG5EKJooSdBfn4rIQiKfruqDbfjU2TYXkZJ5HSg
         TZ2o5wAycEYCyQv2MDtqk9OXzsStdBHwyB4y7qjeprDyLJCJJkEtATjVFu058bqn+7
         VTMMXRsoGzg3uIPjfFDuTjVjE/Ed6mvlpZC2WvSIxcTExyTmehL4l5Zup9UjRRhIQg
         UeuMg7MfT2nOUD8T//NBLDj0ArCmr/TVWxh/1F7L90mY+JR1hHZ5Mb8VT/Iz8cgPl8
         K3VkYb6N4nvkDMOa0m83RGgrpyJ0KgMiBHR2ijr6m0VBNHMH4VtOGjgg+KIYFkX3DP
         g3Yo63t8KteHg==
Received: by mail-wm1-f69.google.com with SMTP id a203-20020a1c7fd4000000b0034574187420so597450wmd.5
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Dec 2021 08:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wzGK8JrM0qK5K+9nNV1QJqS+dRB/4uLBgfT0d3ILjG4=;
        b=l7OVinPZNmsp2rw9oA/KpsWMkwxZUQScEHfIZRAUjxP7iSp9mEzw8+AdHGb2OpDYLU
         bQDhpeJQweqr5SLUkS8mkz2l7U2wNOWAISj40SMKfBWNybdR6mv338ko9TLlI4Vy0+OS
         yQHZECzI7JR/YgnDfiDbekVtMMDqpiPIawIDX+B8TPFtGvCb9VozlG3HSswcBGc/uBVW
         8oCC016TDI6ZjxLwAi+iPcBvbTfUTUqFvW17eu2LL1CLBkenQAiiCC2fWUtQOjGT29T1
         XH4fLlTNAFmO5PvHe8v0xp10Iij42kk0Bn71kji8vxRk2hdQJ4BZTppPDrAm3iSRrLy7
         3QRw==
X-Gm-Message-State: AOAM5311WvUJaz1JTLsVOa9qcc8eowgD/5nVL9h6+n84L3Qr1yjatyaB
        ePv7RgACEfnMGodOWxcP7+4m52MFrQw4K5MwJ/mtUS/bQsFP5C2TRHkBRXWtqPh9FKHTKTnTTLk
        m+uJEu3K/cM62R7j6yQmpc3etYWbi2md0rt73Yp+mrqwN
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr4157668wrn.707.1639672842472;
        Thu, 16 Dec 2021 08:40:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMEaAfgUDbbHkpgBFCHapS6AIPsW5OiAs1LX+6oRtRz2kYhV8oYHhxxQZU7b3y6qvplc2a+w==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr4157652wrn.707.1639672842269;
        Thu, 16 Dec 2021 08:40:42 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr. [90.112.158.1])
        by smtp.gmail.com with ESMTPSA id o4sm3938290wmc.43.2021.12.16.08.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 08:40:41 -0800 (PST)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH v2 1/2] dt-bindings: mfd: Fix typo "DA9093" -> "DA9063"
Date:   Thu, 16 Dec 2021 17:40:36 +0100
Message-Id: <20211216164037.2888316-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The device described is the "DA9063", not "DA9093", so fix this typo.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/devicetree/bindings/mfd/da9063.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
index 8da879935c59..91b79a21d403 100644
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ b/Documentation/devicetree/bindings/mfd/da9063.txt
@@ -1,6 +1,6 @@
 * Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
 
-DA9093 consists of a large and varied group of sub-devices (I2C Only):
+DA9063 consists of a large and varied group of sub-devices (I2C Only):
 
 Device                   Supply Names    Description
 ------                   ------------    -----------
-- 
2.32.0

