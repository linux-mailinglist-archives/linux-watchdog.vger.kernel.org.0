Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C056B4E3B21
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Mar 2022 09:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbiCVItW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Mar 2022 04:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiCVItW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Mar 2022 04:49:22 -0400
X-Greylist: delayed 562 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Mar 2022 01:47:52 PDT
Received: from mx08-005c9601.pphosted.com (mx08-005c9601.pphosted.com [205.220.185.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE8A6CA56
        for <linux-watchdog@vger.kernel.org>; Tue, 22 Mar 2022 01:47:52 -0700 (PDT)
Received: from pps.filterd (m0237837.ppops.net [127.0.0.1])
        by mx08-005c9601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22M51cV1026155;
        Tue, 22 Mar 2022 09:38:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wago.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=p012021; bh=elVzu5WuorUrXPjdwDvy+4PkktuOvgFO/qlSv0qRYRo=;
 b=aax12AG/bVG2YQSHk3mcqgjJWdBgGx5xj59zPcHYJ0pxzyUF9RNeIb8TgtdtIzeJem2U
 hEEDAaQA/2jTL/0pB+l+V+u+/Eb/R2slM9Wo2Z6Q95RMVJONYy6jSqvDbUpD06Uhltsa
 ri34xZypcMtedFankcqDJpNT84X9N1W7ISHzBoLCWcQKZuvooXkar7mpQNBv1Vkmlcrs
 F1P0uRsoBcanWPDZwNTHbhlrTu0exczCSKH2TXPwiemjS+nnoSlfCCfBCDk5XFbaTGu6
 L9K6JiVqEN9GKs2y/onKwVCd6yff1e6/ozyLS3u1YImAttdfM343NiZ2fZKtD6uGPdHw tA== 
Received: from mail.wago.com ([217.237.185.168])
        by mx08-005c9601.pphosted.com (PPS) with ESMTPS id 3ew4pcjrdv-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 22 Mar 2022 09:38:15 +0100
Received: from SVEX01011.wago.local (10.1.103.229) by SVEX01012.wago.local
 (10.1.103.230) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 22 Mar
 2022 09:38:11 +0100
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (10.1.103.197) by
 outlook.wago.com (10.1.103.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21 via Frontend
 Transport; Tue, 22 Mar 2022 09:38:11 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imSNcRerjLTuE+vw+OcdakaGBL2Os4ZPTFfEoemFqA2B6gkyhToXdBeklJOCaH+SyP+oqoExxpS5k0MvPU0RvIgW6JKh8h6oVvuSywscoou1rDxfZd3nXpdwKQr3KMMIv42OBpOV4pO+f+CiEeCOelMOmZ7xF10Jfn13X6Mjt89aSVMOWmlDHwt/0d4dhld8mUjyaEh0RWmeaPX7Vw/m6W2wOfgqAHX48Wwb8+Y8TXsw+7JFWhYNLlz/EV99ZGNrLaYRxFELybNRqLIDRsqCv1iomCU80jiN7nLKWkVNE6Pa6RK+h/F1uRfeO0or1xs1ePPm+Ju4up85lIAAiuT4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elVzu5WuorUrXPjdwDvy+4PkktuOvgFO/qlSv0qRYRo=;
 b=mCmMsvH2VeQKn0jXLlt2hamjPdyZSP55ii7i9oz5J6GKzwiLQh5m6+7mkWHIr2vsErHViCxgECz/r6rku2GmXNiuZz2gohH8SkKDFQup7N0JsjXX+9Gz0iZImJGKV2r/jYt7N6MQvCk2vUe8Wag75oz1wx2RphXruklOzdwMnD8Ti1KnJ+MxLzB06jm+eGW2MhO50Q5JunlTweqB0LKoT1I5VxQ+H2Af0qXjSh3cNWH0N5X2arhtJlEX0QZUV+6aaFmOA20X5MzCfZgR8w53p4YGITfzolhFVqbh4xsEzE8Xd+wn+MLotGptF7HVmeYD6BOZsMDwq/b6h8o4UxnLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wago.com; dmarc=pass action=none header.from=wago.com;
 dkim=pass header.d=wago.com; arc=none
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com (2603:10a6:10:38::15)
 by AM6PR08MB3686.eurprd08.prod.outlook.com (2603:10a6:20b:8d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Tue, 22 Mar
 2022 08:38:10 +0000
Received: from DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb]) by DB8PR08MB5097.eurprd08.prod.outlook.com
 ([fe80::cc57:a7c3:cf03:e4cb%6]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 08:38:10 +0000
From:   =?iso-8859-1?Q?Sondhau=DF=2C_Jan?= <Jan.Sondhauss@wago.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        =?iso-8859-1?Q?Sondhau=DF=2C_Jan?= <Jan.Sondhauss@wago.com>
Subject: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger pattern
Thread-Topic: [PATCH] drivers: watchdog: omap_wdt: ensure working trigger
 pattern
Thread-Index: AQHYPcgpzFMATYhehkq/vc00jmQNSw==
Date:   Tue, 22 Mar 2022 08:38:10 +0000
Message-ID: <20220322083754.50322-1-jan.sondhauss@wago.com>
Accept-Language: en-DE, en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.35.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf5ede94-caf5-4989-ac9c-08da0bdf4bd9
x-ms-traffictypediagnostic: AM6PR08MB3686:EE_
x-microsoft-antispam-prvs: <AM6PR08MB368629A39C9AD4D91FB469AB8A179@AM6PR08MB3686.eurprd08.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GI0a18pMvuXIlZiQPiAPJnF3jo0yFy+wd31aHVnPcf3a09i9EL/AR992XdDDZ3TmG3VmEiH2gQAdFcquPRTiCiRzLuwxlmvyVu/UAzEoMUgrHDtjwYFwNVqvp3pUeQUPwGMgLtAq4PygK7fMGQYrOe5CWaKDglAKVMHVWQDYVuTXZkqvsf30zEx0bNzmYwtOWMN0eE7U9Sj09noQcQEoMmgyj9GE+IMzxWQln3fR77vWH98NodBqRFEEyw73LI+1BQ5133x4CDLdH9c/uf3LytYesBbCwgSvb4WZWzdaZWU+XU6id+RSEsi8+baSqrg3Al6T7XUVyzza7g/LnJxYeN61a9DKeXrRDAGcYeAR+OIKkJs+SXn9dqyykbxOFGtAFWXVha8SJw7Io8tZNBKXHoRpMe0KVqvS9dedOvvfsdFsayn4zOvWdiBqiypj77NNQLziQ2JkG6Xm0AbEiT706tB5YXw+OlsjXVLrd4h8dtPIMSUTZ0YfX7KzgHkyCR71tXuX4ZVDUDO1s3AICv5AYnuYOZvVfbY4KG1rw58QzjXc6jhyMOXv230/1CHrQjibUqZi+SsccyYUyQVTdsefRYIV7aQnqjVi3Fo4QJNZFkRh47zVV4NKqfT6YXIvGPmjaiezJiMxTHqQMO9NvXHSNyz/ZJH/upti8CNzhdjOZFtBr1NENzfOgbOjTiUCEKgO6DnYsXUyFGkvqEOq9yO1TQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5097.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(1076003)(2616005)(8676002)(64756008)(38070700005)(66556008)(76116006)(91956017)(66476007)(38100700002)(66446008)(26005)(4326008)(316002)(8936002)(83380400001)(186003)(5660300002)(86362001)(107886003)(54906003)(2906002)(6506007)(6512007)(71200400001)(122000001)(110136005)(6486002)(508600001)(36756003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tWHETDR1PVAPOp2kPsn1kGjqvaebeZ59Y8l+FxRkfXcH/1QwX0FpHUySc/?=
 =?iso-8859-1?Q?iD39U4i3b1EtL+88OAj43OM/Lkcc8AIpCj2zR99ghtSS9uSk3sZXevnFFL?=
 =?iso-8859-1?Q?oYz6sT5bCBT0jdwnqTI7FYIzXvtASgozQpMLGhqP0Cp+oa2/37qzivRnB8?=
 =?iso-8859-1?Q?WKthLmOvGAb7DgXC4OlmEWMzPFvHiwe8qbODpchdgNAIRGQ09ChWJ0EvFy?=
 =?iso-8859-1?Q?RWj7LoBMtEeg+HggLvtcB98xGBwdvQA+23F8RXqJpmCwTpN4934T4L3MCW?=
 =?iso-8859-1?Q?ChOsqrGqwFXFO7XE+uP6Y7q+PuEis8EZWnptI6XBreZZBXSdNrEgbn0JCQ?=
 =?iso-8859-1?Q?S+9d09dcHmL1hZRfbJyIfX67asYndZCU270Ni6WZ78KkDf/qu7IzMoSgWm?=
 =?iso-8859-1?Q?hOt1v7TD1VQ3cG8FXk0adiAgq6vWiD5UJ8GZICe748RzUtJjPj+Vu81IZl?=
 =?iso-8859-1?Q?6/QNIgqhWaV6w7n4zJbwaMwjcxS/vEdUXae9JEDEIlLTEGSzax6atBYiFp?=
 =?iso-8859-1?Q?rbu8r4HulWJ1BOzIFHj3T7GWTFFhl9eNyrQEro/+zFfxZ8+cPhE8tQc8mB?=
 =?iso-8859-1?Q?UwHXcfh8Mlcljq4l9hA2JOFOg6dZpRzwKFTR4Kadnw5DhfTtLVjP8YvVnK?=
 =?iso-8859-1?Q?ohknHQivZXtdzSdBIfxXX1dFNwfBsOrt7riMc+tR066tDkXFx+NqTRXS5y?=
 =?iso-8859-1?Q?ZPyWKfivzAWtjjexuOfCY7nf/XO25XrlIm6e+rBK25AnBS2UzQAyVbHCEw?=
 =?iso-8859-1?Q?+YflaaTX2zW1RMCGBJKPooKTUXVqEkzlIZF06YUscY1DtXkNlY06TuzPB5?=
 =?iso-8859-1?Q?DEqFz7iLP52xovXp6HZj15i7z6ko/WHEapDBeKiePNBmplXrk14/I1NShX?=
 =?iso-8859-1?Q?FnPVrBWDGJl1q65Y+RVQxK6alxfhhYrYix/t1dBjqKa8GhccwBf+7SpLfV?=
 =?iso-8859-1?Q?EoXJ8h04vVxgEknsaTZD+yFbScf1LI7r4vaCAx3yzn2JRV2RjBFgDvYfjV?=
 =?iso-8859-1?Q?UjHRNZ9zaKzeB5b85E20DMwUvMazjMPN4Z+2sLWlHpYaOL4XmDyWehsCsg?=
 =?iso-8859-1?Q?7l8SCPPEzPD14Hxwfp86sghj5g7V8tsNRkA+Yeouayi1zh7Ouz+GWBOP5L?=
 =?iso-8859-1?Q?sezYgUw7Ssk+cZzlToS4bwwATxvtibii9Oh6R2QoYSwRicZlK95qLTKvvW?=
 =?iso-8859-1?Q?9eBZalbYdE/iwQ3U4/QaO/lhcarFH200TbyRuXbSpM4w0b8C2AQ0DQ3jUk?=
 =?iso-8859-1?Q?BO2/kQ+5un3IL7+0iYFkL4jlJLVbFj0ZQavueKwZdfgF8eByD+dtQvkdCI?=
 =?iso-8859-1?Q?myPTgsMHp0hLrltDfG7/XeUCWu4XkdNQ9mPFrvkAkCPvo8UpZiAYBPfs4Z?=
 =?iso-8859-1?Q?sVxw0TdEjVVjBgKsWNOhtnr73e2DTrOnm8OBzf7Gd83z+JQtbIJoraCFVe?=
 =?iso-8859-1?Q?5UQw0MS5OuC2ecOGG/W1ZYrO3vyfs7g0zZWaHpoIbMBWJpwYSW1dTjT2OJ?=
 =?iso-8859-1?Q?GvT6hX2xuB/r8WfVchsgvqaNYhALSo7Zb8YgP4YNu91Q=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR08MB5097.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5ede94-caf5-4989-ac9c-08da0bdf4bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2022 08:38:10.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e211c965-dd84-4c9f-bc3f-4215552a0857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPLZNH/Eh0hyqXhtHLzLkmyEwOW9r7fL1p+5mUiDvd2YcbgeLqko5sNjuyDwA1CfQjvjkVrkqMbsjSIYSwxxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3686
X-OriginatorOrg: wago.com
X-KSE-ServerInfo: SVEX01012.wago.local, 9
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 22.03.2022 06:23:00
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-Proofpoint-GUID: 1kd06pYsM9zT21Nebm3FZeg6aIMce3WK
X-Proofpoint-ORIG-GUID: 1kd06pYsM9zT21Nebm3FZeg6aIMce3WK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_02,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220052
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

When the watchdog is initialized and triggered before the kernel runs,
it must be ensured that the kernel uses a different trigger pattern.
Otherwise the watchdog cannot be kicked.

Reading the current counter reload trigger pattern from the watchdog
hardware during probing makes sure that the trigger pattern is different
from the one previously used.

Signed-off-by: Jan Sondhauss <jan.sondhauss@wago.com>
---
 drivers/watchdog/omap_wdt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 74d785b2b478..680a34588425 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -85,6 +85,13 @@ static void omap_wdt_reload(struct omap_wdt_dev *wdev)
 	/* reloaded WCRR from WLDR */
 }
=20
+static void omap_wdt_init_trgr_pattern(struct omap_wdt_dev *wdev)
+{
+	void __iomem    *base =3D wdev->base;
+
+	wdev->wdt_trgr_pattern =3D readl_relaxed(base + OMAP_WATCHDOG_TGR);
+}
+
 static void omap_wdt_enable(struct omap_wdt_dev *wdev)
 {
 	void __iomem *base =3D wdev->base;
@@ -238,7 +245,6 @@ static int omap_wdt_probe(struct platform_device *pdev)
=20
 	wdev->omap_wdt_users	=3D false;
 	wdev->dev		=3D &pdev->dev;
-	wdev->wdt_trgr_pattern	=3D 0x1234;
 	mutex_init(&wdev->lock);
=20
 	/* reserve static register mappings */
@@ -253,6 +259,8 @@ static int omap_wdt_probe(struct platform_device *pdev)
 	wdev->wdog.timeout =3D TIMER_MARGIN_DEFAULT;
 	wdev->wdog.parent =3D &pdev->dev;
=20
+	omap_wdt_init_trgr_pattern(wdev);
+
 	watchdog_init_timeout(&wdev->wdog, timer_margin, &pdev->dev);
=20
 	watchdog_set_nowayout(&wdev->wdog, nowayout);
--=20
2.35.1
