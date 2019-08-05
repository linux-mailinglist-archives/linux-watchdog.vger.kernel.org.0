Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D366818B2
	for <lists+linux-watchdog@lfdr.de>; Mon,  5 Aug 2019 14:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbfHEMD3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 5 Aug 2019 08:03:29 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34203 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfHEMD2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 5 Aug 2019 08:03:28 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so84176788wrm.1
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Aug 2019 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25vkHl8TD36SDkWAHJSebVeUcYzajPzPyvWuGyvsAhE=;
        b=YsSmtNhPFyHUW78r8S8MLbZSVSttppTiKSHIpoTXSYeR5QcxdpBE3Ufjq7uEYjXEgI
         dmPita3jsLeyX+7v624q99DrW+MmNpmWYsEAhy89ozWnEx7jAS7THW7DoJIvKpHLU4Nz
         9aFASsRrlhEZoc2qAjHVR99E+wveNzGFLrFxWo3EKEAk2bNQp8yreK7u4jhnjkQAuZfa
         XWPp8sUcX0TsIg8hykvT+yfFktlIFBGwJluuut+8sWQHkWbrYWSxUl2wwgOseujOmnAW
         4CqAO3UiS22yAK6aVqzOSY60m2gG31BbRwJ4Pq51qzxLNJAVlt43AJ2iVFH8qg/vO1PP
         0Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=25vkHl8TD36SDkWAHJSebVeUcYzajPzPyvWuGyvsAhE=;
        b=UsdZGVxCLTHClhhLcpjGNrBRXsQHUR1wsUz6AnmlSX93pb5qs7UbKJXsn86s2gLbed
         nWmAzLx2gd9herKTOVfE6eUQ5147t6QLnzYUNnmrh5uvA4M4nSU9TYWSdNnIdQ5H8YZr
         YOT4WOKPZreqShpKML3Rtf7oo7k98qj3G8kCz6WSiPIyBeXLJJgGrUlw6ArIfBdH1J49
         MICH+uPwMvpqLQuinJCSr/kHRWh9GaDgeuMMjaQuSstPBy7poHYSpyZum0aiOksdiXPY
         HQr2NFgQ4DTxe8g+q6T0xRYv5R2spppvBKiBv5B9oWNrYyM002ZJr4fjFZNFWWTOziKO
         eDwQ==
X-Gm-Message-State: APjAAAVR4BIcjQTCNjrMehKRelxFhXfpXLHbyPmzpA5Oz7ppK8Jj+YZi
        S7dj6nVn7p27TO2Zh7LV2n/LsA==
X-Google-Smtp-Source: APXvYqzWNv12kSRQOLPMH0DQ/Rtt60lADy18oRMLOjwk/7REfS0XxZobWQLA74rD/m007PEBCxIPPQ==
X-Received: by 2002:a05:6000:1148:: with SMTP id d8mr4777553wrx.354.1565006605620;
        Mon, 05 Aug 2019 05:03:25 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x6sm88683668wrt.63.2019.08.05.05.03.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 05:03:25 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, kishon@ti.com, p.zabel@pengutronix.de
Subject: [RFCv2 0/9] dt-bindings: first tentative of conversion to yaml format
Date:   Mon,  5 Aug 2019 14:03:11 +0200
Message-Id: <20190805120320.32282-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This is a first tentative to convert some of the simplest Amlogic
dt-bindings to the yaml format.

All have been tested using :
$ make ARCH=arm64 dtbs_check

Issues with the amlogic arm64 DTs has already been identified thanks
to the validation scripts. The DT fixes will be pushed once these yaml
bindings are acked.

Changes since rfc v1:
- Fixed bindings according to Rob's comments
- Added commit log
- renamed yaml files using amlogic prefix

Neil Armstrong (9):
  dt-bindings: mailbox: meson-mhu: convert to yaml
  dt-bindings: rng: amlogic,meson-rng: convert to yaml
  dt-bindings: spi: meson: convert to yaml
  dt-bindings: reset: amlogic,meson-reset: convert to yaml
  dt-bindings: arm: amlogic: amlogic,meson-gx-ao-secure: convert to yaml
  dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
  dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml
  dt-bindings: serial: meson-uart: convert to yaml
  dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml

 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 52 +++++++++++++
 .../mailbox/amlogic,meson-gxbb-mhu.yaml       | 53 ++++++++++++++
 .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ---------
 .../phy/amlogic,meson-g12a-usb2-phy.yaml      | 63 ++++++++++++++++
 .../phy/amlogic,meson-g12a-usb3-pcie-phy.yaml | 57 +++++++++++++++
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 ------
 .../bindings/reset/amlogic,meson-reset.txt    | 19 -----
 .../bindings/reset/amlogic,meson-reset.yaml   | 37 ++++++++++
 .../bindings/rng/amlogic,meson-rng.txt        | 21 ------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 ++++++++++
 .../bindings/serial/amlogic,meson-uart.txt    | 38 ----------
 .../bindings/serial/amlogic,meson-uart.yaml   | 73 +++++++++++++++++++
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 67 +++++++++++++++++
 .../bindings/spi/amlogic,meson6-spifc.yaml    | 53 ++++++++++++++
 .../devicetree/bindings/spi/spi-meson.txt     | 55 --------------
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 ++++++++++
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 ----
 19 files changed, 529 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

-- 
2.22.0

