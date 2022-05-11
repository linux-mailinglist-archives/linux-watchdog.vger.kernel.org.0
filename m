Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA23522EE6
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 11:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiEKJED (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 05:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiEKJEC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 05:04:02 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33765140C7;
        Wed, 11 May 2022 02:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu9YmJNO+kqRnfTWZfBOliCREMUsGUEfvKejpxPOIPsB95QPoLBJPFswo8Xx2o5yfyBRjYvr5hglU1maWoIysrq154x0lJOdtRSk0zWwPP2I+VfewIUhFU4D/uvrvVYYc+48fu739xBbDf6Na3gcD774ZCBaGyW88qxCxuszvbyee75tZwrcwujHZFfygNt0rx3epNZHsWvT7LG7I11+UWce9MtDfSwoYMzPyu6WD8Gd2gjEogycAo9+wU52Th/w4S7oOy4srFg7x+ExXT1f/QcjqdjWuYKKnv84GrXoH21sFrN+6ldwGpRt9iTtpGaHivS+XqpplFVUKzmFBYH1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tibCi76eDWUYX7Qp1ER850tlOteDGR9I2Pf+8dOhCmM=;
 b=c9RAlXa6fqzpHgcOGhQ25/LNIs6GNYYwCiUizQ4mErLK7npK9zDXL5Q1VmsV3n2EnkT5KUVFGVrevf4SeiCuE3llO4y6plyppYU7GWSu+DzU1JFLarKd9AbIxKfANVaH5ZY3qH3tocaFBEd/YNquwn5ZgDbpV7Q/Pa5inIWEruDp3223tWx+8WnPYz3MYqr0JWXQLFW3LfWdEfVnjSItIDQNaArYl0Nh+jdvQ6reysc3zORJsIpCXVfQL3zAEy9IN+p8sFoEID+0QAnGU/rDxMMC+wXPEFSTApDCG0587BjhQYuthttHkPG2zS6dPAMO4N4e24/PpcAY0EK9/eTqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tibCi76eDWUYX7Qp1ER850tlOteDGR9I2Pf+8dOhCmM=;
 b=MRAsgDdRCklCmlLRLJeZ3Hj0MbAxQiRRO8q2Wib+h37eKAsIXWtY05yCW1FSwlmxpEQTEoXezxlEMfobt4aREPXU+2SzTcdjMswSmA7IR0hNSSNihBUyibRdIinB6KVK7x6vyBbnrdjnV53KTHwdjrQyUk2LsDpApmaEWUnfSoY=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by TYXPR01MB1757.jpnprd01.prod.outlook.com (2603:1096:403:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 09:03:57 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 09:03:57 +0000
From:   DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To:     Primoz Fiser <primoz.fiser@norik.com>,
        DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>,
        "upstream@phytec.de" <upstream@phytec.de>
Subject: RE: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Thread-Topic: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Thread-Index: AQHYVhplJ5kLDnzAaUyV7WjxlssYq60WV6RQgAMjwgCAAAHAcA==
Date:   Wed, 11 May 2022 09:03:57 +0000
Message-ID: <OSAPR01MB506044E281215C098A9EA692B0C89@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <20220422072713.3172345-2-primoz.fiser@norik.com>
 <OSAPR01MB50604479A24C65CAD349104DB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
 <210bbfdc-32ac-737e-15ad-a2de12464e52@norik.com>
In-Reply-To: <210bbfdc-32ac-737e-15ad-a2de12464e52@norik.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aabb2141-2200-47ba-7dd5-08da332d2e73
x-ms-traffictypediagnostic: TYXPR01MB1757:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <TYXPR01MB1757238FDE16742367B823ABC1C89@TYXPR01MB1757.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x50kye2zeb+sqYyvaJCzCHd58RSLJ2bLTx0X3oRLMFztUnW2h1MkkmqBF3A6aS7ulg7C/ebZ1XUaSFjiC/EmsJ5Bd62g8NtwUCdzRiPrkAa3N//HZObbRhQBwpUcD89op0kB2ncNPMsI8d9Sv6wuXzO9Ex5tQZ6QDShI9mziukb60pqSEnos8OMrECyOa6BUeT6tdrazKnSwqfqcuSTOFTYbs663tnmQ76xOv8Y0HRbTx4hoYROgVjSR8HdVuoYJDyPi0wlVdMLN1374bmA+kPqs4hKptVeEFOPBCCiPhVB/tnY00tz9piVR8rZMYbQye0G7pt62CmuZuBxBVuALrgV/62hkVxFucA2Xxv/tOxfbAgAG8uyBJ5nSNGmCJrg4NCy0fAr+FzXSIj6X5ylxAG2ySPoWW811HC1kbSOrEd6GMTpQOEk0AGYg4HqjebxSy0pr/zPG+ZgMJ3iRU1ArMRM0gcOpCgwsMF6FDM9FnhD9gLYzfIqodAGV4YaykAVAeHZHfuUqj/aoijgKDPfBZjHXcPHjJoKvGRbhHebJolKOrLuocjv4pPE5ODBKXDvVZGzlSV9ESm88MoyFquLqAY6+Pz0CvLyBvY5JPZizjSsNdTizmqIklV5frSAA9lbKyjlQz0UQOwM4En5alOhz70MMMYXEkBB3vRSXBZPcoWwdQccPWG6/TTP+mQ1udxpUSJN2z/OlHmc9AvLKekpTsy97W2ie0SUpz8FacBKw7E0BPS0y4Npkom86SEkBJRlJ/G4cJp7RCNxyADTo49vooqpTuhfdRKqJp5JE3+yqb3E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB5060.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(86362001)(66446008)(66946007)(66556008)(76116006)(64756008)(66476007)(4326008)(83380400001)(316002)(8676002)(55016003)(7416002)(54906003)(5660300002)(110136005)(508600001)(52536014)(15650500001)(38100700002)(8936002)(2906002)(71200400001)(6506007)(38070700005)(53546011)(186003)(33656002)(9686003)(7696005)(26005)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE9JeDk3M0ZEaTdWT2FGZGVKNm5wU25xSFFPUDZ3MU0yL1Z3V21qd2pLcVhl?=
 =?utf-8?B?MFlxampSYUV4ZDhobHY5RTBRdjdSQlExZXhmTVViL0Rvd2VQeWUxVHBOZk1Y?=
 =?utf-8?B?d3ZodE84aHVuVS81c0Jic09YbE5MM0dRcTZ6aHkxU1ladE9hKy9SZnhuaUdy?=
 =?utf-8?B?TS92a2VqOG1aQUljMTJUS2N3ZStOdFR5WmIyY0Jpd2ltaUNDYTYvZVM4WE5t?=
 =?utf-8?B?L1hkY1dHNGRlWDlWcWFsblFpekRMbkhqeXY2a1BkOElJK0NpZElMdCtwMFVW?=
 =?utf-8?B?OUxOc3R4c1FyS3h0VTJ0endMSnNTa3M4M05vL0sxb0lLUDBDNlUyUnRTV2Ji?=
 =?utf-8?B?UTVybXZnaHhVSTdIdTNJazIrVE9BQW95YjJHZDJDNlJhYXRvQnJjYkN1a0VN?=
 =?utf-8?B?RFd6RTh3RFlJajBtc01neUxkY0Z5ZEFyQ0g0RzRUaTFRTWczK3RKcGhRVkhm?=
 =?utf-8?B?WXRmdDIvL2JHRmFQK2lqNDQ0UFA5VzkvTkVEd1R5cHN2V0ErdjFxK3lzVU1v?=
 =?utf-8?B?cm80UVdGWXVpRFVsUXczYk1JNkk4dVlsdGNRaHIwSG9MT0d0RTdBNVlpVmxN?=
 =?utf-8?B?OS9zTTlkcUpCdkpxV3g2aFIzblk5bHNNYUZBVng2cW5JLzh6L1RjYVFtRTFq?=
 =?utf-8?B?ZW1CVXl0WUpnVm45aGlRNm96Nzd4M1VRbSt0ZTJlQ0NpNC9lTGRweDBFbjI1?=
 =?utf-8?B?aTNWdVR6WldoRUpQQnJwR0ZIZmNCZ2prdk9QWnFabndrbTBlWUxLRVB0VitD?=
 =?utf-8?B?SW5OZlBPUjF1SWs4Uk5nVS9vVmpOYStvNDdIRU1TZVBONFZJNUNuc1hSaFlm?=
 =?utf-8?B?aHFIcWQ0NkJZRFp4UEFDcmpWMGVxQkx5QWQ2dGZRanJNZ0lqU294LzNMemZT?=
 =?utf-8?B?SjNUZWQzUTBVbkt1QlJ2OHRqYXIyc0VmMkFab0NSK2YrK2NQUCtiOW1Kb2lt?=
 =?utf-8?B?RHpqcTJlaUpFQ0g0SURCUkZ4UkgrQXprbnBvcFlpYTltSkJCUTUxOXVzQzVy?=
 =?utf-8?B?US9WVFhOdCtJMEJveDhRNms0Y0pjTWh3RTZtT1hUeVRHSmdwbWRXY29CdjFr?=
 =?utf-8?B?K3EvTk9iNzRVMjN5MWhDazNSdHhFc0lDNFdSU1pyU0tHY1N6WnUxOFdzRVh5?=
 =?utf-8?B?Qmo4b2RBT2JFS0RZc3VnM2l0aVVWenNFZ2M5UEk1YjhmTCtKRENxMTl3ekt4?=
 =?utf-8?B?VDVvZEpCMGhVNGZJVjNDUzlsVTJBQ2dvb1RYQUczdDRic085U0gwbys0V2dw?=
 =?utf-8?B?QmJjOGpZRlFSS2Mwa1hyMWpFd2hNZEZTRkJidXF2RW9pbi9sbjliaGZnZXBD?=
 =?utf-8?B?MEx0SGsvSXUvVlVsMTE5cXoxZ1BHSDhHTFU3aVlONGs1bHpOZDc5YzNYazJR?=
 =?utf-8?B?ZW1ZMjZQQmc2Z2ZUcURNeG9JSXVnaCtlQlE1UmlvSnlEMTlNMm9MbmpqaTNp?=
 =?utf-8?B?ZFBKL3Z6ZEdzMzN5OVR0RWkwMWk2VkJGMjlQTXdPV2lxbUI3MkhRSXoyU0xS?=
 =?utf-8?B?NTVidGE2b2kydXlneWl6VmJ1b1I0NlZNL2MxOVRUQWJIVk53OUovYnlrTXVo?=
 =?utf-8?B?NHd0SVEyZ2ZFZ0xsVzhnQ2praFFRcWRLc1YxSE9tVk5QYjl4dGlvTFg2ZVpQ?=
 =?utf-8?B?OHdlRlRhaXJnak5Eb2krYkZRZ1U0UnJ0K2VTejM3Z041NmNYWkNPdWhraW9k?=
 =?utf-8?B?U3p1T3VvN05ZSXBVN1grdXdUeHZZLzNjdDIxeE14VnhaWHJjOXJ0a2JJR1NR?=
 =?utf-8?B?ak1SbVJ6eEVncmxYSlQ5a1Jta0N0dlpNalZvRTF3S2NxNVljZytxazlRTERC?=
 =?utf-8?B?dDBYLzQzWFBFdlVnT2tpNFM1WjhKbXJXbDVCUzRDbXJuRTlCd2RCWE1FWVRu?=
 =?utf-8?B?QjBxYmVnalF5UlZjSUp1MTN4cmtlN3F0ZFEvaTd6SXNkNjd4MU9MczFFUWFE?=
 =?utf-8?B?U1ZVWEwwQ250RElNNXRoVHdwQU1Id3IzM1RYcStHMUJvM3NKSytqQTBRamNm?=
 =?utf-8?B?REgrNTJmVEJrQjVlV2xORjhRUzVQN2tyOVUzK2grUUNkNC9KWHJXcEdJbFBP?=
 =?utf-8?B?WGllekFiM1BJU0lzZFZBS3F5N0xlMURBY1hzZUJZODVpcnRKZUtVYTVsUSt4?=
 =?utf-8?B?UDZkNDdKVHBwZ25yd1lLblBhSEVrRFh6ZjJkd1NzL2lXbXpvK2Z3RnpyWW5j?=
 =?utf-8?B?STgwR296QndhNTQzSzdqWWxMMXp4L0QwbmxvVUJNT3gxakdienFJK2pmdTRJ?=
 =?utf-8?B?engvWUkrcDhVU0FXRVhEcm8yQnhtV3lFblJ1K055Y3AzRW14YnlpcjA3c0Vm?=
 =?utf-8?B?dUx4alVZcG95VGVnQ2VtazB6NTVOWHNIa09HMWtrVFozMkVZajNocGFSL2s5?=
 =?utf-8?Q?zcouTCrwp0KTOI0c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabb2141-2200-47ba-7dd5-08da332d2e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 09:03:57.2055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f6KZCaA4BkC2J/gtxpPEJrdZaTx5y2hqlq/DYbSlmt67WboLfkoPxcsdRQIWR0MZbwqkgBb8xYZjrYs4bI6lbsjM+NqzcWMOVw9RLeD9k1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1757
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMTEgTWF5IDIwMjIgMDk6NDgsIFByaW1veiBGaXNlciB3cm90ZToNCg0KPiA+PiBPcHRpb25h
bGx5IGRpc2FibGUgd2F0Y2hkb2cgZHVyaW5nIHN1c3BlbmQgKGlmIGVuYWJsZWQpIGFuZCByZS1l
bmFibGUNCj4gPj4gaXQgdXBvbiByZXN1bWUuDQo+ID4+IFRoaXMgZW5hYmxlcyBib2FyZHMgdG8g
c2xlZXAgd2l0aG91dCBiZWluZyBpbnRlcnJ1cHRlZCBieSB0aGUgd2F0Y2hkb2cuDQo+ID4+DQo+
ID4+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gY29tbWl0IGY2Yzk4YjA4MzgxYyAoIndhdGNoZG9n
OiBkYTkwNjI6IGFkZA0KPiA+PiBwb3dlciBtYW5hZ2VtZW50IG9wcyIpIGFuZCBjb21taXQgODU0
MTY3M2QyYTVmICgid2F0Y2hkb2c6IGRhOTA2MjogZml4DQo+ID4+IHBvd2VyIG1hbmFnZW1lbnQg
b3BzIikgYW5kIGJyaW5ncyB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IHRvIERBOTA2My4NCj4gPg0K
PiA+IFRoZXJlJ3MgYSBXQVRDSERPR19QRCBiaXQgKHNldCB0byAwKSB0byBhY2hpZXZlIHRoaXMg
SSBiZWxpZXZlLCBhbmQgdGh1cw0KPiA+IHJlbW92ZXMgdGhlIG5lZWQgZm9yIHRoZSBzdXNwZW5k
L3Jlc3VtZSBQTSBmdW5jdGlvbnMuIElzIHRoaXMgc29tZXRoaW5nDQo+IHlvdSd2ZQ0KPiA+IHRy
aWVkPyBBbHNvIHNlZW1zIHRvIGJlIHByZXNlbnQgZm9yIERBOTA2MS8yIGFzIHdlbGwgc28gY2Fu
J3QgcmVtZW1iZXIgd2h5DQo+IHRoYXQNCj4gPiB3YXNuJ3QgdXNlZCB0aGVyZS4NCj4NCj4gSWRl
YWxseSBvbmUgc2hvdWxkIGJlIGFibGUgdG8gdXNlIFdBVENIRE9HX1BEIGJpdCBpbmRlZWQuDQo+
DQo+IEhvd2V2ZXIgdGhlcmUgYXJlIGJvYXJkcyBvdXQgdGhlcmUgd2hpY2ggZG9uJ3QgaGF2ZSB0
aGUgYWJpbGl0eSB0byB1c2UNCj4gdGhlIFBNSUMncyBwb3dlcmRvd24vYWN0aXZlIG1vZGUgZHVl
IHRvIFBDQiBkZXNpZ24gYW5kIHRodXMgUE1JQyBpcyBsZWZ0DQo+IGVuYWJsZWQgZHVyaW5nIHN1
c3BlbmQgaS5lLiBjYW5ub3QgdXNlIHRoZSBQT1dFUkRPV04gbW9kZS4NCj4NCj4gQ2hlY2sgbWFp
bGluZyBsaXN0IGNvcnJlc3BvbmRlbmNlIFsxXSB3aGljaCBhbHJlYWR5IGdhdmUgZXhwbGFuYXRp
b24gd2h5DQo+IHRoZXJlIHdhcyBhIG5lZWQgdG8gaW1wbGVtZW50IHN1Y2ggcXVpcmtzIGZvciBk
YTkwNjIgYW5kIHRoZSBuZWVkIHRvDQo+IGhhbmRsZSB0aGlzIGluIHNvZnR3YXJlIGluc3RlYWQg
b2YgaGFyZHdhcmUuDQo+DQo+IExpbmtzOg0KPg0KPiBbMV0NCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMTkxMTI4MTcxOTMxLjIyNTYzLTEtbS5mZWxzY2hAcGVuZ3V0cm9uaXguZGUv
DQoNCkF0IGxlYXN0IEknbSBjb25zaXN0ZW50IGluIG15IGZpcnN0IHJlc3BvbnNlIDopDQoNClll
cyBJIHJlbWVtYmVyIHRoZSBkaXNjdXNzaW9uIG5vdy4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIu
IEluIHdoaWNoIGNhc2U6DQoNClJldmlld2VkLWJ5OiBBZGFtIFRob21zb24gPERMRy1BZGFtLlRo
b21zb24uT3BlbnNvdXJjZUBkbS5yZW5lc2FzLmNvbT4NCg==
