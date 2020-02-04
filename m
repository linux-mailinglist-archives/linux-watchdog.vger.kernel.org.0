Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 596AD151D14
	for <lists+linux-watchdog@lfdr.de>; Tue,  4 Feb 2020 16:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgBDPVf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 4 Feb 2020 10:21:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37634 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbgBDPVf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 4 Feb 2020 10:21:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so4156733wmf.2;
        Tue, 04 Feb 2020 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hw4xZ1kYqp8gKYk3+om1U5PHQxcSQbw6w+wShSO5zY0=;
        b=Tb/kG89v4p60cznaGWi4jGb0no5xjGih/XfTLAI6BV/XsqyP9CYXMCcKMCYu8jdPwp
         fR37Eae23M8tczpXWmyORXL8LrJS2wOQzOfF+OUFLUmtYXo5736HH+hSQ9tMTFm9VsEE
         rGY+mOtHUr8E8NGFRYTV2IunnlnXWnTM8zPWkCLs6v+PDW7AgXLMShECvwdYYi06eAwv
         mo5wenDUAA/36f/0k9eKOzVgispGoLYw7dIJEvgu+zgcNM4O8VmMQFlWNKxrCQ4ejDm3
         7GiO694T439wMIydZko/acP0dc0fY+rE2KDbuHzVJuObC/bAyt4wEPmJ1W6wmI5Kt6M/
         iRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hw4xZ1kYqp8gKYk3+om1U5PHQxcSQbw6w+wShSO5zY0=;
        b=obTBZ8tTb7HnC0ujQ3sWgWyOa1rl6wIw3BnZ2C7sfeCDlTHBe7hPJ3EHesUbsYqfHX
         /XwrXNFJQ27B/Cqe77xWpT8R3ftYOR4kXcunttmOmQ8GuYwz6uTnhB1un0RG0RtHR1jn
         sHreBl/XrMPoFDjTzvG03QAbcCZWCDT7yfq6vfsZTNYo33gySOiJzWstFbJnnr4uOmbG
         jPZ0BZC88Htw/SzxqMu3ruaX6yM/UqTATQi7S/D1eCKKKR5iDnoVKQ4aCgeM8cP5fESG
         YqnU21O99v2q6dWsrmYSegeptQzrGvIIGns/CvLY476JLMxN1LG/wzlkUVzUxbOTvUSU
         5tBQ==
X-Gm-Message-State: APjAAAVCZA7HAs1XkYXKRUMs033UZBwQTi7jCnDVhYtejh6rlQXyDY1U
        ilNReoiYKwUdhvjjwqktYN8=
X-Google-Smtp-Source: APXvYqyqhJRpF0IBUgqXPq4gRr+htq5lVI2geTgVCQj21fYbe1kHlA6HUzk8LLHguNfpfHKhvvTNgw==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr6674925wma.49.1580829692715;
        Tue, 04 Feb 2020 07:21:32 -0800 (PST)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
        by smtp.googlemail.com with ESMTPSA id x10sm29902174wrv.60.2020.02.04.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 07:21:32 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Documentation: watchdog: qcom-wdt: Remove deprecated compatible
Date:   Tue,  4 Feb 2020 16:21:02 +0100
Message-Id: <20200204152104.13278-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200204152104.13278-1-ansuelsmth@gmail.com>
References: <20200204152104.13278-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

"qcom,kpss-wdt-msm8960"
"qcom,kpss-wdt-apq8064"
"qcom,kpss-wdt-ipq8064"
"qcom,kpss-wdt-ipq4019"

and deprectaed and not used in the driver code at all. Drop them and
fix the example.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
index 41aeaa2ff0f8..33081bd33637 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
@@ -4,10 +4,6 @@ Qualcomm Krait Processor Sub-system (KPSS) Watchdog
 Required properties :
 - compatible : shall contain only one of the following:
 
-			"qcom,kpss-wdt-msm8960"
-			"qcom,kpss-wdt-apq8064"
-			"qcom,kpss-wdt-ipq8064"
-			"qcom,kpss-wdt-ipq4019"
 			"qcom,kpss-timer"
 			"qcom,scss-timer"
 			"qcom,kpss-wdt"
@@ -21,7 +17,7 @@ Optional properties :
 
 Example:
 	watchdog@208a038 {
-		compatible = "qcom,kpss-wdt-ipq8064";
+		compatible = "qcom,kpss-timer";
 		reg = <0x0208a038 0x40>;
 		clocks = <&sleep_clk>;
 		timeout-sec = <10>;
-- 
2.24.0

