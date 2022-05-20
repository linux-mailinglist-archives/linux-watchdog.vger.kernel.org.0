Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D189E52EBCF
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 May 2022 14:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349101AbiETMRh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 20 May 2022 08:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349093AbiETMRf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 20 May 2022 08:17:35 -0400
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A241632BE
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 05:17:33 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20220520121731epoutp0279359fff365d7ae817dadd6f1d9fad43~wz1qnI3KE0362203622epoutp02Z
        for <linux-watchdog@vger.kernel.org>; Fri, 20 May 2022 12:17:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20220520121731epoutp0279359fff365d7ae817dadd6f1d9fad43~wz1qnI3KE0362203622epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653049051;
        bh=xP99BHy3NDk4ZEKQ8QQmI7N87j2LUxR4osjG49m0npw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vImv3EEEEW68xwYCkOBZAikjPfSpoRsdooEu8O1DibjEhzlR9rt4iqSTug21hR8/l
         /jrixACmwnkUNxg8dWU3WEtKdy4kx7xRLvjCjVWB8eGXP1QB8XYVcbFMjw4xKSRkv6
         hclFH7RYhUuo4T+UzHlyeJTQ9snETiamDWY0wP0w=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220520121730epcas2p16892b99fe18f5b86b3f3ae4ebe3bf6b0~wz1pWUus72976929769epcas2p1N;
        Fri, 20 May 2022 12:17:30 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.88]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4L4Qhj3kHvz4x9Pw; Fri, 20 May
        2022 12:17:25 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        F5.B5.10069.3D687826; Fri, 20 May 2022 21:17:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epcas2p460fce9626fe2b4a857925704e2ea5ba1~wz1iWQw7r1929119291epcas2p4z;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220520121722epsmtrp23182ea775ae890478e0abd7b64a2baaa~wz1iVSx3N1007010070epsmtrp2b;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
X-AuditID: b6c32a45-a79ff70000002755-18-628786d30ba5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        FD.2A.08924.2D687826; Fri, 20 May 2022 21:17:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220520121722epsmtip2b508527be974c7daeb8ea103d2a60592~wz1iF8qdz0334103341epsmtip2D;
        Fri, 20 May 2022 12:17:22 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 4/4] arm64: dts: exynosautov9-sadk: enable watchdog devices
Date:   Fri, 20 May 2022 21:17:50 +0900
Message-Id: <20220520121750.71473-5-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520121750.71473-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmhe7ltvYkg5aTEhaX92tbzD9yjtVi
        7+ut7BYzzu9jsrixbh+7xZOFZ5gsWvceYbd43gcUe/zyH7MDp8emVZ1sHneu7WHzWLlmDavH
        zu8N7B59W1YxenzeJBfAFpVtk5GamJJapJCal5yfkpmXbqvkHRzvHG9qZmCoa2hpYa6kkJeY
        m2qr5OIToOuWmQN0lJJCWWJOKVAoILG4WEnfzqYov7QkVSEjv7jEVim1ICWnwLxArzgxt7g0
        L10vL7XEytDAwMgUqDAhO6Pnt1bBItaKtXckGhgPsHQxcnJICJhIfJrykbmLkYtDSGAHo8Sc
        A3PYIJxPjBJ/d69nhXA+M0r0fjrGCNPSv72bESKxi1Hi1453UM5HRomeT3OZQKrYBHQltjx/
        BZYQEVjLKPH8+USwWcwgLZvv/wFyODiEBbwlDi9OBWlgEVCV6Nr2nRnE5hWwk7j/+zbUhfIS
        G+b3gsU5Bewl/j74ywpRIyhxcuYTsBpmoJrmrbPBvpAQ+Mkuse87zK0uEk3HzrFD2MISr45v
        gbKlJD6/28sGYRdLLJ31iQmiuYFR4vK2X1AJY4lZz9oZQQ5lFtCUWL9LH8SUEFCWOHILai+f
        RMfhv+wQYV6JjjYhiEZ1iQPbp0OdLyvRPeczK4TtITH7BSxIJzFKHFi+n3UCo8IsJO/MQvLO
        LITFCxiZVzGKpRYU56anFhsVGMJjODk/dxMjOJFque5gnPz2g94hRiYOxkOMEhzMSiK8jLkt
        SUK8KYmVValF+fFFpTmpxYcYTYGBPZFZSjQ5H5jK80riDU0sDUzMzAzNjUwNzJXEeb1SNiQK
        CaQnlqRmp6YWpBbB9DFxcEo1MG3/civc1fqT3NvVDyNP79Tf3Jq4V27dRx62Hc+fuNw6rCvX
        fHvOVbbbnBZLfktMbjv+OsdgwYMHym99z3Ea1n2bKDTjyq0tl+TmbAj5UTjF9aVVv/I/1neP
        VzGUhUxntC+wjGu4VPrGq7RY8XGs2wPHleETE/Ma3Vy5b1y7q16cuFcr64prl+jd8uzJFqY8
        SzfUlm+8M+n/xM2ck+V+mvUsE2E4J3CiUc1ul+KinEup5dYLLiQmBDb0qJ6uKon8t6ZwgbzV
        2r6ZOmov8yLkeOase7vh9kwFHc4Lx37IPnq4NuDj3oITnQrBDy9N3G/TKm1mx6BtnMIRNCt4
        xWXZR5FcxcW2u0sFLjnMifSbeUiJpTgj0VCLuag4EQDhmQkJLQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsWy7bCSvO6ltvYkg88dchaX92tbzD9yjtVi
        7+ut7BYzzu9jsrixbh+7xZOFZ5gsWvceYbd43gcUe/zyH7MDp8emVZ1sHneu7WHzWLlmDavH
        zu8N7B59W1YxenzeJBfAFsVlk5Kak1mWWqRvl8CV0fNbq2ARa8XaOxINjAdYuhg5OSQETCT6
        t3czdjFycQgJ7GCUOLhhPxNEQlbi2bsd7BC2sMT9liOsILaQwHtGiSmLtUFsNgFdiS3PX4E1
        iwisZ5T4tWsmWBGzwD5Gifa5EV2MHBzCAt4ShxengoRZBFQlurZ9ZwaxeQXsJO7/vg11hLzE
        hvm9YHFOAXuJvw/+Qu2yk5j15TsjRL2gxMmZT1ggxstLNG+dzTyBUWAWktQsJKkFjEyrGCVT
        C4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCg11LawfjnlUf9A4xMnEwHmKU4GBWEuFlzG1J
        EuJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFqEUyWiYNTqoHJkNF5QbVu
        0TWOKT0py6YVXD71+MLt9TX6581vXpXZr8yzUfhCUdf6qvmvu3jD3ku2HZRYGH266qhs1nG2
        rkUtFt7bjU0ql/NG1d7SOrK9cOuWUwvcV+lrPO6zPafu++ZAOedpkZx8VdZVZsJ6z+en7NqR
        tCEm/rOP223l2twft9k9/GvrXpbuD4ud7t187pibsWnEjSzTh6oO2w5xTK+SbA/yNrqRXNY7
        MaPruffBhQ18m14qzYlf/HiV7U5z1o0Tr7w/vTb4sb+6s8ecyLTAa8K75qzexfFjT962c+sm
        JTyL/rsi9YLQ6isvN3x/9otfh2mXOo/wmg9xYlPXdpTfdLXhSy1x1LM23fOpoMlKiaU4I9FQ
        i7moOBEA876hO+UCAAA=
X-CMS-MailID: 20220520121722epcas2p460fce9626fe2b4a857925704e2ea5ba1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p460fce9626fe2b4a857925704e2ea5ba1
References: <20220520121750.71473-1-chanho61.park@samsung.com>
        <CGME20220520121722epcas2p460fce9626fe2b4a857925704e2ea5ba1@epcas2p4.samsung.com>
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Enables two watchdog devices for exynosautov9-sadk board.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index 17e568853eb6..ef0285262c84 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -62,3 +62,11 @@ &usi_0 {
 &xtcxo {
 	clock-frequency = <26000000>;
 };
+
+&watchdog_cl0 {
+	status = "okay";
+};
+
+&watchdog_cl1 {
+	status = "okay";
+};
-- 
2.36.1

