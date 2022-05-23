Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA497530EE4
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 May 2022 15:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbiEWLac (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 May 2022 07:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234749AbiEWLa1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 May 2022 07:30:27 -0400
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8554F9CE
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 04:30:24 -0700 (PDT)
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20220523113022epoutp045d191900b530ac4bbd5dfd2237fcf9c8~xuIWszD0Y0077000770epoutp04F
        for <linux-watchdog@vger.kernel.org>; Mon, 23 May 2022 11:30:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20220523113022epoutp045d191900b530ac4bbd5dfd2237fcf9c8~xuIWszD0Y0077000770epoutp04F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1653305422;
        bh=4IFayU2lfdgNu9EW5xKS0zmUvY4WPz8PL5PJzayhj5E=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=pRkEXneOXeLZl+CVYdMU+/jafXUIobkCRAYWX9ZUMvMv7D5/g89Mn55UpMU+RjthL
         HKWL0VYeEI6KIqvJCiUhQd/c/qvazWQ70JHg/vpJBWWWXbM28wdWgckBi56lvbYW/J
         5JH1ZZ0BPAbgi1zkGqUz/emnTv5WhIiux6eE809Q=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTP id
        20220523113022epcas2p1706d6327843dc6faab846ee2920441ba~xuIWR6uWA3019930199epcas2p1C;
        Mon, 23 May 2022 11:30:22 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.89]) by
        epsnrtp1.localdomain (Postfix) with ESMTP id 4L6FVx70Sbz4x9Pp; Mon, 23 May
        2022 11:30:17 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
        epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        BF.7E.10028.8407B826; Mon, 23 May 2022 20:30:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
        20220523113016epcas2p360bf51a6b39a6e17f258fcae4ee158a5~xuIQzBrAO2186921869epcas2p3u;
        Mon, 23 May 2022 11:30:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220523113016epsmtrp2bba6fa6640e4263ba5561724c0ebb7ad~xuIQyUVk20080900809epsmtrp2p;
        Mon, 23 May 2022 11:30:16 +0000 (GMT)
X-AuditID: b6c32a47-589ff7000000272c-f4-628b70487e36
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A1.8D.11276.8407B826; Mon, 23 May 2022 20:30:16 +0900 (KST)
Received: from KORCO082417 (unknown [10.229.8.121]) by epsmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20220523113015epsmtip1988448b1e301280d7630bdf1485edb3b~xuIQpgv1T1284612846epsmtip1z;
        Mon, 23 May 2022 11:30:15 +0000 (GMT)
From:   "Chanho Park" <chanho61.park@samsung.com>
To:     "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
        "'Wim Van Sebroeck'" <wim@linux-watchdog.org>,
        "'Guenter Roeck'" <linux@roeck-us.net>,
        "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Sam Protsenko'" <semen.protsenko@linaro.org>,
        <linux-watchdog@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>
In-Reply-To: <02fb065d-5ad9-07df-0e1d-1b47beb883dc@linaro.org>
Subject: RE: [PATCH 3/4] arm64: dts: exynosautov9: add watchdog DT nodes
Date:   Mon, 23 May 2022 20:30:16 +0900
Message-ID: <003f01d86e98$798eddc0$6cac9940$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFlWeMGeRnkp6RKcHlQJHAIxTVWcwKk/mfLAdT13k8BkyXh8a3iE/tQ
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmqa5HQXeSwbIWBYv5R86xWux9vZXd
        Ysb5fUwWN9btY7d4svAMk0Xr3iPsFs/7gGKPX/5jduDw2LSqk83jzrU9bB4r16xh9dj5vYHd
        4/MmuQDWqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfM
        HKBblBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF5gV6xYm5xaV56Xp5qSVWhgYG
        RqZAhQnZGWsOdTIW/OWoeP7kIVsD42r2LkZODgkBE4lTe24zdTFycQgJ7GCUOD2tlRUkISTw
        iVHiw+NQiMQ3Ron9Z66wwXRsevsdqmMvo8TD20tYIJwXjBJT/n4Em8smoC/xsmMbK0hCBKRq
        0oaDYHOZBWYzSkw8aAhicwrYSVzqnMECYgsLeEjcbZsI1swioCrR37wXKM7BwStgKdHQ7Q0S
        5hUQlDg58wkLxBhtiWULXzNDXKQg8fPpMrDxIgJuEr8PTmGGqBGRmN3Zxgxyg4TAXA6JLfuO
        QTW4SJzb08kEYQtLvDq+BRoYUhKf3+2FerNYYumsT0wQzQ2MEpe3/YJKGEvMetbOCHIcs4Cm
        xPpd+iCmhICyxJFbULfxSXQc/ssOEeaV6GgTgmhUlziwfToLhC0r0T3nM+sERqVZSD6bheSz
        WUg+mIWwawEjyypGsdSC4tz01GKjAmN4ZCfn525iBCdTLfcdjDPeftA7xMjEwXiIUYKDWUmE
        d3tiR5IQb0piZVVqUX58UWlOavEhRlNgUE9klhJNzgem87ySeEMTSwMTMzNDcyNTA3MlcV6v
        lA2JQgLpiSWp2ampBalFMH1MHJxSDUxbjvxI6HuqUlk4c+Z17mlfN2lcqF4z8xBvnjsrf1Kb
        i+7fN7/Sls+ezTTt+6dXu/epLL/R5tlip/Hp2wad9rRNc0pf3D3mPG37RW5v7X1FikGVP9MX
        vwo8IVHoKsn+/Jwyk+L+J7csHPmeXtno/r303/V7aoFxX0R9zDj+Hrig+9xX6dpVrv7Nn7JX
        bOOK4Jw+1561ODavJKzmzStLF2nOLhlv/s2rnXvD21KsEw/PZV0WfeMim52x5rEczvQo+QCF
        owfsUm4JSPIp/DC8WdltZqb40zZp5nRWKb1deckinHzftLZdjI1aZupempe3VrzZ58hryfN7
        +l7sfpWs8fEas2Cv3e8rFydohNs/e6fEUpyRaKjFXFScCADIHeypLwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42LZdlhJTtejoDvJYMlKVov5R86xWux9vZXd
        Ysb5fUwWN9btY7d4svAMk0Xr3iPsFs/7gGKPX/5jduDw2LSqk83jzrU9bB4r16xh9dj5vYHd
        4/MmuQDWKC6blNSczLLUIn27BK6MszvOMBdc5qg489GsgbGRvYuRk0NCwERi09vvTF2MXBxC
        ArsZJbbN/8kGkZCVePZuB1SRsMT9liOsILaQwDNGiTmNSiA2m4C+xMuObawgzSIC+xkl/qyZ
        AjaJWWAuo0Rv4x92iLFfGSXaj04CG8spYCdxqXMGC4gtLOAhcbdtItgKFgFVif7mvUBxDg5e
        AUuJhm5vkDCvgKDEyZlPwMqZBbQleh+2MsLYyxa+Zoa4TkHi59NlYNeJCLhJ/D44hRmiRkRi
        dmcb8wRG4VlIRs1CMmoWklGzkLQsYGRZxSiZWlCcm55bbFhgmJdarlecmFtcmpeul5yfu4kR
        HFlamjsYt6/6oHeIkYmD8RCjBAezkgjv9sSOJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8F7pO
        xgsJpCeWpGanphakFsFkmTg4pRqYIh4HXW/qv1Af8e5n76zDV8+FBZ+fdKM+uMPuyudI3x++
        GnOlxD/Ny09zcHjh83VlxbGXvK5PmO9JLP2vHfPl2oa9D2cLXfFLTnk7x1OtITO3UEWSd6XH
        zrlfhDO3vmF9yFN69paHfqZ1TVLAfL+NwRfnq+vb6czre3Lt5s/KeQ5za20mrf/zrjpTJ3T+
        jIxOqet3ovll9P1fhFb/ynv9LGrFipdrTQLmnvE9mCjAZnJ0hWpNobXT2nMetSK2d2Z27a9y
        bIjccH5N3jE+C8v66TbxNzsMD20JClzw/RR7H+f0jcsMHJ3DspkO8Gs8TvU9du75u7CJST9e
        T1U/w+9YKpR4eqNZSLPyqlXRPlnZSizFGYmGWsxFxYkA8/q4NBsDAAA=
X-CMS-MailID: 20220523113016epcas2p360bf51a6b39a6e17f258fcae4ee158a5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220520121722epcas2p169b2669f367e7461fa41663f3e90d303
References: <20220520121750.71473-1-chanho61.park@samsung.com>
        <CGME20220520121722epcas2p169b2669f367e7461fa41663f3e90d303@epcas2p1.samsung.com>
        <20220520121750.71473-4-chanho61.park@samsung.com>
        <02fb065d-5ad9-07df-0e1d-1b47beb883dc@linaro.org>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> > diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > index 3e23db8f09d9..34be955dc2d5 100644
> > --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> > =40=40 -400,6 +400,28 =40=40 ufs_0: ufs0=4017e00000 =7B
> >  			samsung,sysreg =3D <&syscon_fsys2 0x710>;
> >  			status =3D =22disabled=22;
> >  		=7D;
> > +
> > +		watchdog_cl0: watchdog=4010050000 =7B
> > +			compatible =3D =22samsung,exynosautov9-wdt=22;
> > +			reg =3D <0x10050000 0x100>;
> > +			interrupts =3D <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cmu_peris CLK_GOUT_WDT_CLUSTER0>, <&xtcxo>;
> > +			clock-names =3D =22watchdog=22, =22watchdog_src=22;
> > +			samsung,syscon-phandle =3D <&pmu_system_controller>;
> > +			samsung,cluster-index =3D <0>;
> > +			status =3D =22disabled=22;
>=20
> Blocks which do not need board-level resources should be enabled by
> default, so drop status and drop patch =234.

Okay. They can be enabled as default. I'll drop the status and =234 patch a=
s well.

Best Regards,
Chanho Park

