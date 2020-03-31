Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07C15199E65
	for <lists+linux-watchdog@lfdr.de>; Tue, 31 Mar 2020 20:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgCaSuP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 31 Mar 2020 14:50:15 -0400
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:33247 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgCaSuP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 31 Mar 2020 14:50:15 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 31 Mar 2020 14:50:14 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=335; q=dns/txt; s=iport;
  t=1585680614; x=1586890214;
  h=from:to:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=aw3Ejn6bjkGbyipSQt+JgGJGD1ObhaAHbtMmo7lA8S8=;
  b=LEJQ8AbmEa/uVvsH6umJy7f4VUT4lydfCLI0cQpFmKUAtWLhDMyn6d1g
   AmzyVd1Vh2RuFCYUVqJO2uDjNVpFlkeUTTmvJZ0fO2cRB1FUwLPx3EYmO
   J93ox47T3C/JqaDHeZ1uGVc8NYt5LL0fmFeQ0oDYlA3a+/Z2IqOLK7vzo
   I=;
IronPort-PHdr: =?us-ascii?q?9a23=3A0cFjzBT9eOz4jM5WgAf6GQOPF9psv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESXBNfA8/wRje3QvuigQmEG7Zub+FE6OJ1XH1?=
 =?us-ascii?q?5g640NmhA4RsuMCEn1NvnvOiAzGsVPUEBs13q6KkNSXs35Yg6arw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CjMQCSjoNe/5RdJa1mHAEBATgBBAQ?=
 =?us-ascii?q?BAQIBBwEBgVWBPgIBARBQBYFEIAQLKgqHVQOKbU6RMROIaoJSA1QKAQEBDAE?=
 =?us-ascii?q?BLQIEAQGGeyQ4EwIDAQELAQEFAQEBAgEFBG2FVgyGCSgGAQE4EQEpFR8FHic?=
 =?us-ascii?q?EATSFUAMuAaMuAoE5iGKCJ4J/AQEFhRgYggwJgTYCAQEBAYwtGoFBP48hsHE?=
 =?us-ascii?q?Kgj2XCykOgi0BmTKPG5wFAgQCBAUCDgEBBYFpIiqBLnAVgydQGA2SEIpVdIE?=
 =?us-ascii?q?pjFQBgQ8BAQ?=
X-IronPort-AV: E=Sophos;i="5.72,328,1580774400"; 
   d="scan'208";a="658798671"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 31 Mar 2020 18:43:07 +0000
Received: from XCH-ALN-005.cisco.com (xch-aln-005.cisco.com [173.36.7.15])
        by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 02VIh130001952
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Tue, 31 Mar 2020 18:43:07 GMT
Received: from xhs-aln-003.cisco.com (173.37.135.120) by XCH-ALN-005.cisco.com
 (173.36.7.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Mar
 2020 13:43:06 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-aln-003.cisco.com
 (173.37.135.120) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 31 Mar
 2020 13:43:06 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 31 Mar 2020 14:43:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRFEKn3+kwRPqYw+CXSlr3+WwJE6blM/yVUNnNnlhqcjBOgaiifnDUq5Uy23yMryUgM7T7CRw77x481JUQOmhCyuySr5m+F5wZsRQl9TopnkcyUFwn2zcVdFQt/TicpjoUH+P3VnH+hXPh/tp4q7XFQV+x8bFcuda2hPv/Aa5lN36DNikGJL8DKt3hk4QYIW/16Ez2vM5UNrHy11XDSHRdlmmDOIRvlwZvQSja4Vy90etZAcqm5zOjDJp2ITA5hBIpwiLcwPpv91pUU0iV1YfkWGpcT3XsIjA+TzrYf83akQaGOm0wOd8UaF+4Un/QZEuFXTYo7VbCBTLqfZk2KExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw3Ejn6bjkGbyipSQt+JgGJGD1ObhaAHbtMmo7lA8S8=;
 b=NVODku+hCq7Kwo0Y++XXhOsyM9ScKSVoqSWg8/wLk02W0Ch1w//9VqDM1judL09IQkdzcztvtPdakRbaHTT0jTub1Mcp/rRrIEvrLZHTREGCSNaK4XDMLqMNPUgqRrGdk1gXCStypkRRcjcH3Sr6q3YR6IHRDGejqQ/pOlgiRCED6BLFsdBe8qWodUflUACAkqMFMnmAnrMJMzUMaOmfsJHw25pKPAp+YPwt1c8bi+SLLXfZbPDzdDukWu2vwZzcOT21oHHQSaWG0nxWFvlMJYnRaeXwGDo8pIgjFh20S8cV/O0U5aQ3EaNOrz/I8gWIZ1unEhBoSWaHLLSimUPdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw3Ejn6bjkGbyipSQt+JgGJGD1ObhaAHbtMmo7lA8S8=;
 b=LsKMDL82GJoCJrjcKAABRYZsCFXxz6jjFEO+BnC2GgIKltI1g1YJ1gadWIjDQFr+STZqoKkGqVDSm6iQchb/Wz+o0M3HxZCSo158X5yue+q5firtZ5yzsajruuIpQZOOKUYXrmtZNX1GxdCdSFhp9x0JI4VHiyT/gETgmrPPsV0=
Received: from BYAPR11MB3205.namprd11.prod.outlook.com (2603:10b6:a03:1e::32)
 by BYAPR11MB2743.namprd11.prod.outlook.com (2603:10b6:a02:c7::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 18:43:05 +0000
Received: from BYAPR11MB3205.namprd11.prod.outlook.com
 ([fe80::d015:3039:2595:7222]) by BYAPR11MB3205.namprd11.prod.outlook.com
 ([fe80::d015:3039:2595:7222%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 18:43:05 +0000
From:   "Daniel Walker (danielwa)" <danielwa@cisco.com>
To:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>
Subject: iTCO core dumping on timeout ?
Thread-Topic: iTCO core dumping on timeout ?
Thread-Index: AQHWB4w2NxzuWNvJsUOWZ1JeofHf0A==
Date:   Tue, 31 Mar 2020 18:43:05 +0000
Message-ID: <20200331184304.GW823@zorba>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=danielwa@cisco.com; 
x-originating-ip: [128.107.241.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4dbca216-b2d6-472c-3efd-08d7d5a3596f
x-ms-traffictypediagnostic: BYAPR11MB2743:
x-microsoft-antispam-prvs: <BYAPR11MB27435A9B0BB37DDCEE2B65B2DDC80@BYAPR11MB2743.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3205.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(7916004)(136003)(366004)(396003)(376002)(346002)(39860400002)(66556008)(86362001)(71200400001)(4744005)(110136005)(66476007)(81156014)(26005)(8936002)(66446008)(1076003)(186003)(66946007)(316002)(64756008)(76116006)(478600001)(81166006)(5660300002)(33656002)(6486002)(2906002)(33716001)(8676002)(9686003)(6512007)(6506007);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bf8rWfG3FRmVzFnRvfS0CjBvZTCxp8wnZy2k0NxYVGplx4H7avvXt5BnTUsgngdbd01ZXmFdrxvHAByEzB1ztalpudfAIIGcB9xEDlRLCKD3U4L//CFYIEbTgyW7gXxoZ8GJaiZqXQrDZ5YGwMM7KsUoADps5SVPhOVisFu5DOZ3twEgruj0xl0K8CieH+2ktRu4+YkP2bE21tPqEh08QSmuMxXUsLRr7jfdNLd+nGI87ZeYfJgQ9pobJr5hUiHUuuVflW72d1w+uR1eiQRPCm/roodKiMg5CGuO3aAEGLN2LshwZsDxvzducrhLPZxru/uSfSepY3RfBLU5UpTWdLDKn912bG43RafbAg4mPaGkOH67AK1jY3pS5UisKmizdbpRhXO/eO299kdzFHSxtyxyMTYZytv3C9wR6nQ8LOh85vmAJlqU0puVvirotOr3
x-ms-exchange-antispam-messagedata: d5b/cbXTsg2leTZbuEPvRhadjIEwKtOVRt26GdrDvjw99agOwOehfDoOmNNNPNvG0K0w1PwQb2c6nb5tx6rc169f/zmsRCO92otZe0dyFLxGhpJWIDrhDj0br/aazOb2G25hThzYe8QGG9xTNwmA4Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2360297670ED604593528E0A6A65A72E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbca216-b2d6-472c-3efd-08d7d5a3596f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 18:43:05.2033
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PljG9l388PaGrvsvHhwP4ZxEsamdJFe12Y8Vh/KX0A6oUB9inEfb2u9Q7zYAqNuoTeHWx/BcEr0S4yA3jNYMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2743
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.15, xch-aln-005.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

At Cisco we typical dump a core file in crash cases, and in watchdog timeou=
ts.

It doesn't appear that the iTCO is setup to trigger a core dump, or panic. =
It
looks like it just reboots on triggering.

Is there a method I'm missing which would allow selecting a core or panic f=
or
this driver?

Thanks,
Daniel=
