Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCDF52EBCC
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348999AbiETMRg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349096AbiETMRf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:17:35 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CC431632B7
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:17:33 -0700 (PDT)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220520121731epoutp0485bc1063bdf90a1ba34e1daceb5f319a~wz1qauAcH2337423374epoutp04j
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 12:17:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220520121731epoutp0485bc1063bdf90a1ba34e1daceb5f319a~wz1qauAcH2337423374epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653049051;
        bh=2n+gE7dIHPQyBQFvLAOgwFYfhaK9VXm+jaJNJ2Wr4/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cUpzml3Hgfs2JYo2ZD7oMzx1rE6Q+NT2S1V5/3lqzEfNCfpmey1Q8vCgjjtMcLL01
         Hw8I/oZPIOsId+WWIhZhqENHKEcCuObzuamh2xfbZMlOMGAmxdqHB8XCuzUYyHjdYh
         /3iwfFAsh6Lwt4yoB1/9ChvwIynZTFRmcpuTDEZk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220520121730epcas2p4f04d474bc274e1829e3fcef236ce785f~wz1pkcm_41929119291epcas2p4A;
        Fri, 20 May 2022 12:17:30 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.88]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L4Qhj4m5Hz4x9Pp; Fri, 20 May
        2022 12:17:25 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        B3.6B.10028.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epcas2p169b2669f367e7461fa41663f3e90d303~wz1iNLQmS2976029760epcas2p1D;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520121722epsmtrp20f21391fad4a9165356e592db412e166~wz1iMegbz1007110071epsmtrp2X;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
X-AuditID: b6c32a47-573ff7000000272c-6b-628786d26be3
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        15.ED.11276.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epsmtip2f6cc97d54325e9df21b60519a0709b1d~wz1iCyNpS0067500675epsmtip2W;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 3/4] arm64: dts: exynosautov9: add watchdog DT nodes
Date:   Fri, 20 May 2022 21:17:49 +0900
Message-Id: <20220520121750.71473-4-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520121750.71473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmqe6ltvYkg2/vDS0u79e2mH/kHKvF
        3tdb2S1mnN/HZHFj3T52iycLzzBZtO49wm7xvA8o9vjlP2YHTo9NqzrZPO5c28PmsXLNGlaP
        nd8b2D36tqxi9Pi8SS6ALSrbJiM1MSW1SCE1Lzk/JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8x
        N9VWycUnQNctMwfoKCWFssScUqBQQGJxsZK+nU1RfmlJqkJGfnGJrVJqQUpOgXmBXnFibnFp
        XrpeXmqJlaGBgZEpUGFCdkb/j8CC6dwVa85eYGpgXMLZxcjJISFgIrHn5V+mLkYuDiGBHYwS
        3x78Z4dwPjFK/O85xQbhfGOU2P1vORtMy7R516Ba9jJKfD+0C6rqI6PEsoYFjCBVbAK6Elue
        v2IESYgIrGWUeP58IiuIwyywi1Fi8/0/rCBVwgIuEk3fNgC1c3CwCKhKrHwrCBLmFbCTOPlg
        MjvEOnmJDfN7mUFsTgF7ib8P/rJC1AhKnJz5hAXEZgaqad46mxlkvoTAX3aJjr13oG51kXjU
        vZgRwhaWeHV8C9RQKYnP7/ZC1RRLLJ31iQmiuYFR4vK2X1AJY4lZz9oZQY5jFtCUWL9LH8SU
        EFCWOHILai+fRMfhv+wQYV6JjjYhiEZ1iQPbp7NA2LIS3XM+s0LYHhLfX80Ds4UEJjFKbNwX
        NoFRYRaSb2Yh+WYWwt4FjMyrGMVSC4pz01OLjQqM4TGcnJ+7iRGcSLXcdzDOePtB7xAjEwfj
        IUYJDmYlEV7G3JYkId6UxMqq1KL8+KLSnNTiQ4ymwKCeyCwlmpwPTOV5JfGGJpYGJmZmhuZG
        pgbmSuK8XikbEoUE0hNLUrNTUwtSi2D6mDg4pRqYptaG1PWInrkl9nBj3c9/G2+/ms+jp7us
        uc/7aXDZySpFrwzONoe5Sx8dcRA9fudTlkF6/pTw3MpLFzfcOTLj3ueihBl/bvlkWQsceXb6
        zfl6Pt+Hsl93vmFncLvd92D6x0OXV+4O/8iScTum1zrkLPu+RKMTHjMmF7yeFvaC+/yGM/Zb
        /pd5vHRdf9//4K5qlrc5d1z57k/yT/vamul4fIlLparF+ah9R1xtrs2Kslvy/3zfwf437Qvz
        JmzztFNj3Nm5ZnLXtufnZ5dnPl90NF9oa8zcE4KsM4tCxKe8KDPyk1K/9PzvU+WPfG+fTH1t
        UK/a0bXxs13EmXVdJ9peFIZt15x6wmrK+z3SLYoTFEqVWIozEg21mIuKEwEcAYo/LQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMLMWRmVeSWpSXmKPExsWy7bCSvO6ltvYkg+dXJSwu79e2mH/kHKvF
        3tdb2S1mnN/HZHFj3T52iycLzzBZtO49wm7xvA8o9vjlP2YHTo9NqzrZPO5c28PmsXLNGlaP
        nd8b2D36tqxi9Pi8SS6ALYrLJiU1J7MstUjfLoEro/9HYMF07oo1Zy8wNTAu4exi5OSQEDCR
        mDbvGlMXIxeHkMBuRolPzzcwQyRkJZ6928EOYQtL3G85wgpiCwm8Z5T49y4YxGYT0JXY8vwV
        I0iziMB6Rolfu2aCFTEL7GOUaJ8bAWILC7hINH3bwNbFyMHBIqAqsfKtIEiYV8BO4uSDyVDz
        5SU2zO8F28spYC/x98FfqF12ErO+fGeEqBeUODnzCQvEeHmJ5q2zmScwCsxCkpqFJLWAkWkV
        o2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwuGtp7mDcvuqD3iFGJg7GQ4wSHMxKIryM
        uS1JQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2MFxJITyxJzU5NLUgtgskycXBKNTDJ2+93
        PB+4YXVonXX/nMbi+H0qKQt/9qbM3btuzuki9WpVTTOnpUo9xbMNlK3+Pnmz/MICKwdZNoF1
        rsdKrijfimTgmex5ZdLHf4oPxU+cv/Pz8F6jJWkxMebe7aFpK5aWTbPltBL/naL/b9pD/dDz
        9rPXHlz43+iFsumTwFfMPH+jm61zw5XCIlblP89duJgn36VmFu8stykiuldsImuv/6q/nNH2
        xMA4sNDnbvPexq1P58+fafz3X9IWk+A96qHLds/13bXbciV3so9bsYiYfti8PKbz6/cnpvi8
        Xln3w+KY7+nZtYs4dGfPktkzqc32tdDinxsKJSIKbkXL89h2zzeed+/hr+eXap7eTGFXYinO
        SDTUYi4qTgQAQBwoUuYCAAA=
X-CMS-MailID: 20220520121722epcas2p169b2669f367e7461fa41663f3e90d303
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p169b2669f367e7461fa41663f3e90d303
References: <20220520121750.71473-1-chanho61.park@samsung.com>
        <CGME20220520121722epcas2p169b2669f367e7461fa41663f3e90d303@epcas2p1.samsung.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Adds two cpu watchdog devices for ExynosAutov9 SoC.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 22 ++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 3e23db8f09d9..34be955dc2d5 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -400,6 +400,28 @@ ufs_0: ufs0@17e00000 {
 			samsung,sysreg = <&syscon_fsys2 0x710>;
 			status = "disabled";
 		};
+
+		watchdog_cl0: watchdog@10050000 {
+			compatible = "samsung,exynosautov9-wdt";
+			reg = <0x10050000 0x100>;
+			interrupts = <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER0>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <0>;
+			status = "disabled";
+		};
+
+		watchdog_cl1: watchdog@10060000 {
+			compatible = "samsung,exynosautov9-wdt";
+			reg = <0x10060000 0x100>;
+			interrupts = <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cmu_peris CLK_GOUT_WDT_CLUSTER1>, <&xtcxo>;
+			clock-names = "watchdog", "watchdog_src";
+			samsung,syscon-phandle = <&pmu_system_controller>;
+			samsung,cluster-index = <1>;
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.36.1

