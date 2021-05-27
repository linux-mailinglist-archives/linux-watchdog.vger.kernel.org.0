Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8A9392B53
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 12:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbhE0KDh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 06:03:37 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:64945 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhE0KDa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 06:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1622109717; x=1653645717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NHC7O/pOqdLxXD582td2chdxDt8JFmxVEAYC1qsDiec=;
  b=hlw3ltutZJqMeGeCImyu4JuTkASyBN/LoTIm1qB37KjLJAok+nbQ8Ixr
   uthKjE1vH73v6dC5At8j//5s5tHWE8xo8k6Pp3ScgBvSAon0f4vmHfRUT
   SMHspN8W/zvYwwBTYqrtppwQuFtKe/9SbRfXu8cOZXNdoN7gqRfPcyJ7Z
   LLbmSLV2r7Jd+4yoyfLL5agj6YIU5LQlqEBj9sFmp9M6GkObUPI89wYWJ
   f3e2E0C2p+N9e1uMdEHRIP9bkEQUxewgO3KGX879+xJ6EmmYnhYQhZkF4
   Fxs6VqD7hANqTDfUuKFS71CWTWF0FomUou6Xna81TsuFq5BD1vcg+2/yD
   A==;
IronPort-SDR: HoyDt9JX0VCmKZZHh0afcs5zD3TN+Axb5Z48rdJuRlNdiCQcbhTV/vyZYdFYGusVwcBx/TthGw
 FGh6G5LrlrjpIA8o+fv/flqEWdsG7zZWBWSsrVnK4/3ySsbrh9N0h3jLpBqVb97c16M5mL1YKm
 bJxZ4SzXFPX3XI+i26ITwVyqd0uNitBDk6hmoV8OhV47xvkeoZM4F2Aw89luhLfEvuNVJuQxN+
 VOtuGoiNXtggRUpci/ae6P9F7gWCQpe+ZZK7xTLwX9yeCi1YgseZKSehk9YxvQgC3KXZwMHR2j
 pPU=
X-IronPort-AV: E=Sophos;i="5.82,334,1613458800"; 
   d="scan'208";a="119361978"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2021 03:01:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 03:01:55 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 03:01:49 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <robh+dt@kernel.org>
CC:     <nicolas.ferre@microchip.com>, <linux-watchdog@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH 3/3] dt-bindings: watchdog: sama5d4-wdt: add compatible for sama7g5-wdt
Date:   Thu, 27 May 2021 13:01:20 +0300
Message-ID: <20210527100120.266796-3-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210527100120.266796-1-eugen.hristev@microchip.com>
References: <20210527100120.266796-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This driver is also compatible with the watchdog on sama7g5 SoC.
Add the corresponding compatible string to the binding.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
index 0d0ab81da040..9856cd76c28d 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - atmel,sama5d4-wdt
       - microchip,sam9x60-wdt
+      - microchip,sama7g5-wdt
 
   reg:
     maxItems: 1
-- 
2.25.1

