Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA3891C4C
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 07:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbfHSFRt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 01:17:49 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33982 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfHSFRt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 01:17:49 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so468305pfp.1;
        Sun, 18 Aug 2019 22:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGwG/YSLZYRVL+vJAKs5Bcm3MpdJbEenYZGdWxEpLBk=;
        b=nvB93+LIMhdoi2CaaDpCzS7o1dOMNM+3A21WKpAKWBnuWmftjA+IkGp1UzjUoGvPt2
         +j2EkS5G6ZY46CUxngO27FKFUsqU8w3ReyRRX3UkR+1drtyCLepHPwcN5KW09jab+Zhb
         GScQZ2FStl1PJZ2tDHm4H4BfYEB0YVkzx5LUaREW/9sLMPuMubqY+IalqiR/AXhQrMKp
         0432fj4jPoYILRdkyfhjSr0lR0ICE1fNNzAfcNzye9ffj+BHbqpe9901MBV2oVN3VOC2
         Cfjpn+91AGskyGX4QGYBSsI3t/aGs34xkui9kVhCZQ9SWmY/yoCefRSpaDeVNXe00XKq
         LmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=TGwG/YSLZYRVL+vJAKs5Bcm3MpdJbEenYZGdWxEpLBk=;
        b=kRXcXR7U3gsxcqSQ4ANJXRLrc47cB5LUwqG1cr7VoCgE6v1eIwGNST7kD3+l7SQcRR
         zW+2LAaNgnqhYb3mchQTCzr5AG8q6EUHpK4coNK0LEq7WqOZ00W+3LxtUZEgakeStudG
         JsTuaTc7w5HaS8Vr4G3PUQiL52UXyXhjYUNt+7hL9ypZFIj7etjozzzRGn6sGFrIS6cQ
         MCoxH63KKNR6vTyroFzmZ575SGLZ2AWMvNNghPiz3ByItqD2AVdPbn1SY8YT44KXoPC9
         xLxualfv1DptmX2z60Xi03mpX5Z28libVSkq7RZF7H+9yi36xyehNoDjGQ8K48CAlzEU
         oSXQ==
X-Gm-Message-State: APjAAAVjURN0mPDb0eVjga9nmOv5u1HrWF03w416YXwqOUwsnQFLvK/b
        PRDqRfJntc+L6XL1WBbxYmXQkq7VwXI=
X-Google-Smtp-Source: APXvYqxEgQ3FMUcGf8WGHJW4wXZcDWRMRgUVb9y2dWwhkvXh49b+GxwAQ3nXnVqyKo2MlegRrqcf2A==
X-Received: by 2002:a63:ec03:: with SMTP id j3mr18981805pgh.325.1566191867962;
        Sun, 18 Aug 2019 22:17:47 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
        by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2019 22:17:47 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Andrew Jeffery <andrew@aj.id.au>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH v2 0/2] watchdog: aspeed: Add support for ast2600
Date:   Mon, 19 Aug 2019 14:47:36 +0930
Message-Id: <20190819051738.17370-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello,

Here's a small patch series to enable the ast2600 watchdog.

v2 addresses Guenter's review.

Joel Stanley (1):
  dt-bindings: watchdog: Add ast2600 compatible

Ryan Chen (1):
  watchdog: aspeed: Add support for AST2600

 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 drivers/watchdog/aspeed_wdt.c                             | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.23.0.rc1

