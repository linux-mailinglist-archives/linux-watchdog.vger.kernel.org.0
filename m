Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C035E6ABEDA
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Mar 2023 12:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjCFLz7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Mar 2023 06:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjCFLzw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Mar 2023 06:55:52 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E69EBBA8
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Mar 2023 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678103750; x=1709639750;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ETrVrYw2k0hpg2V7mCIFx31X3oP9cVQPIqskc7yXySI=;
  b=F7wXAAMoe9Rc8z4uGF3ns+q0exBkyLwe8DMLoZqDRZgqjVVpgQFJzsNv
   7xd/L+KmzxN3SKNsU1F30d7KkgVkzI64kdrAl2wRcEFiqf0rrGHpjVvp3
   Av+yAlSZYSpCYPt59uspRj6B8HNWv6ZSV2OIDRPOW3Sfq8DILrwZPr/ak
   aaP5QpfNCDi8A89rJG2wGzqq09I7JHub7Zn1vQ0vY5Zly/sqW0iUSabC1
   A5Xl1M7iV4sIPJByVywfvtL8Hbf89cwMB/TbHE4sQwQn69LOkEJ+tSYnN
   5XzLLXX2YFtXHotUrYxgPmwhRVr71vjEUL6P58cn8zKfBY4zCt/faYNk3
   g==;
X-IronPort-AV: E=Sophos;i="5.98,236,1673938800"; 
   d="scan'208";a="140462280"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Mar 2023 04:55:49 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Mar 2023 04:55:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Mon, 6 Mar 2023 04:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbi+WNsHJj2je5iQRbMWXesp30ZUYigdmI7NcuzfkKHxpMA32kEe4maRkvPfWYiZQ5y2VtSnHlr9uYCsKrXfvfRlwT8N/PI50C7Xrp3awVwT5dO24CwOF4+N0xLYhD9STgQdcICaXaioNKu/oXq0sTd4XZL4mvaBdTYWAIv5hMm0bCBAVASoULWlevwOGVGoDVkTKX9kJSmIVPoxN1Re0ZBuY6FGT2j2j5r9gYY/c3BWmcD2V+ybBDqGm40tIJS/uHVtLHpcS0myaiTTb3yKPzfoQmU2nmi6E3jSYsOBNRqkW0UGNtVoucMvP5JSQDefuMLhV90DXVxOe9f1CGCJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETrVrYw2k0hpg2V7mCIFx31X3oP9cVQPIqskc7yXySI=;
 b=jjJ+lLDQFoDKekWQKszG1fbxPMYmg2rpWrCyvtwYqf2DDSTCoPuZdDAf0Sz5YJbgtSbgXEH/GjTtTweuvTO07K6CYfBvRCcmfjtZ7gPc6+2L0EoIkmrHuVmvc1uy561N/ACcucNl8x89dC/Og1EdIhX7ySamgnclqgMuPv1NgNJ+iUDTdX3gMEc6rm7CZ8gzZ1Fz1DtyuJeiSIJpzXGCz1zDHmRBvXGuhCFERxzjQfYz4lidT7uf/Ik+waYwRdcLnvOkGL/3NwS2B87zrrNq3gORUUo+BUXrXi43b/ErGogVCMnWGgkhfvYjGZC/lsBFQbbkvv4jpCI0K68fzLyLrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETrVrYw2k0hpg2V7mCIFx31X3oP9cVQPIqskc7yXySI=;
 b=YxoU8jn1bpDHO/zAQl5izfjs9FRBTZXBUc51X0pT/+e21wzAbxGybZBHnJlgxI5awDvcBn07uu1wjv38dx4K0ZBs25Hcdz1T0M5zaVX7glb5kjv/b1gdmPmzmQvAIxso0xDJxRqHIKS6FAnEpIsk98ntna7HMzM8GwL9MH3eY3E=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN9PR11MB5557.namprd11.prod.outlook.com (2603:10b6:408:102::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:55:45 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:55:45 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <Nicolas.Ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>
CC:     <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 05/34] watchdog: at91rm9200: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 05/34] watchdog: at91rm9200: Convert to platform remove
 callback returning void
Thread-Index: AQHZUCKVoAh/jLMkcke6JevH52W8iA==
Date:   Mon, 6 Mar 2023 11:55:45 +0000
Message-ID: <2b588dc6-c3ef-a472-84dd-ad1795d2668f@microchip.com>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230303213716.2123717-6-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|BN9PR11MB5557:EE_
x-ms-office365-filtering-correlation-id: bffe01b9-8176-4045-35f2-08db1e39b836
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GZGvb3AgCjhI+ZGGNT18y8EKiOg9jBKaBsEdiIIcUlkhwLuUBIdaa6Zp3UvmOprSJ3ENQ698Up9/2Ryvhu/1NEsmHpwwyAH/uK/zSISKNzaqhmhQvIIuo7yQEnlDNssLToWxY0QEm8p0XqBAiB77cz752uIVfW/r2wUGlwxSojhcPL+0To7QXlFcpgV+WMFicoyL8aCs9IuhgddcUI5OGbimai0C/O/4GjW2q8dO21e+aMqSyepeznkfmWY+FC8a9Rshn4iIH8uHYICZl1se/8fpXwW8qXiS9qrt/f+mqdPIQyD4RALcRXsbxZLgCdX3JdDF5uFyZY40/591BsKAMboO11UAM/1KqoZvu7SEDZG/8OcC4kEUGusfVD3HnuC7xmXks7DDFPb4o6gQtZCLgrfvUwQZoJ4fhk3QfXWKXCGWiNutEnCwRkHCdJdRhgndBYmdlC2t/bIAzmbGbcqPglbmk/nz+0WDO5jocTGwY6QZ9cMv30jDeUutP4QzilKYY3+ELXo3Ii8JyX+G2xCNv9epvjN61JopNUxgBqPafJkajWshxElFs6lds6wqAzhuyRDYT81D69+PcjpxPlQ/ADevruA1lUpu2wTATzW+uVBRJLGTbuRozeS8PFlAAWdgUTvgM6M6DEer+wzj0g1G9xaGmxZsymoYs6R0+HR4O+csqqW+4padXNb+iwzNlKva9KGVxpxHOv1HxE7KCMTGwIjWsdbh5gKSK4ZpZ0FhTm9LwiOiq1hxkJa1tbkSHPCkyHnDp3UtkRioUapFEEDfMQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(6506007)(6512007)(53546011)(66574015)(6486002)(36756003)(38070700005)(83380400001)(31696002)(86362001)(122000001)(38100700002)(186003)(26005)(2616005)(41300700001)(91956017)(66476007)(66946007)(66556008)(76116006)(66446008)(4326008)(8676002)(64756008)(2906002)(8936002)(31686004)(5660300002)(71200400001)(316002)(54906003)(110136005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWFaNm9xN1NiQkxCWGY5b0R4WmtieGZRbDB4VVBaSHQ1RDFRNGtRQkh0MFhH?=
 =?utf-8?B?MUJiRm90WFNBNFg3Y3dqQ29oaTVmSDNucU1RT0JKMFo4RDlDSzBKczEwa3pS?=
 =?utf-8?B?MW9ESmJ2UjFHMnRMUVZFdE5Rem1LQ3hrS2ZPQVVyT09TSGxFb0dDZHBjTzdi?=
 =?utf-8?B?cDZPdGU0ZCtKbUlYQ3Vwdkdsb1dwWSsrK3ROb3ZjbWZXQ1FBOTExSTN0MG1v?=
 =?utf-8?B?WTV1TXpFdVBqL1dLU0w4blJ2NHJHUk1NVGdYdHJ0OHdITjdjQ05YZzNITWxD?=
 =?utf-8?B?WCt3c1Z3MncxU3Jzd0t2cFhjaERXMGRXUWptYVFNT1lac3BZWHFkajIvWXpM?=
 =?utf-8?B?UGFyOTlSZHE4WkJEVFR5UGhTQXdGbXVraWVGWGxzS3R6dUI1M1U2Z0VZNVdO?=
 =?utf-8?B?Rk9uUm9DZHhaODYrOWplUFZNb1EvbTZRSno3dkVLcE5vT3pYNE15TTIwVTlj?=
 =?utf-8?B?RHBhT09mSlJmaVNJUU8wR2pONXllWXBUSjdZRzRnNkhpT2hWcG9IMG9rRWly?=
 =?utf-8?B?UStHdTVZbUNRZTlmczRzU2l2RHZTNDJOTVNaa0U3VVBpWk1uTXY0SFZvZHVR?=
 =?utf-8?B?akdNdUplcVZqaVpscm5ZMnZLb0JqZGNIYTFhZ1A2K1J4d1ZhRElvRm9LVWMw?=
 =?utf-8?B?K3hvQTFFaFdycXViMkN3ckpBNkFnZW9IWStxUTBhODRJSU9HdGoyYWdEQWE3?=
 =?utf-8?B?QW9iTUdIVHVYNHhzL0tMQjlxcDdDS1phZjBuK29FUUtKQzQ0UUluV010Z3JY?=
 =?utf-8?B?RnRZWm45YUVQays5Q0lmYklqSDVuM3ZtWGVSS08rTE9tMGY1RlVDSHg2Z1ZF?=
 =?utf-8?B?SnJWQ3p1Z25tbWMxVW5kMlpxYjlGbFZkZlBpbzIwbU1XeXlmcGJ1eHI3N05l?=
 =?utf-8?B?eVVZVktjQU5YaHJLd2QrcmNLMzJJb2ZtRk5iQ09kbHQ5blZwNkRpSUhra1la?=
 =?utf-8?B?QUVMbUVNU1Q2cGtoc2M4cEhjYTZlWmRoL2FvK05SbkRRTEdmV3FSSFhEUVEy?=
 =?utf-8?B?M3BMa2hUaUZHdVM3alUwcTFjMVhwN0tyK0ZJL3lKQklobUkxTjBnTVpvM0V6?=
 =?utf-8?B?TFhzd2JtbUU5bUhzbzJURFpUdFNtTXlEUU1ZOEJCdmhUNHJ5Lzk0UmNmeEF1?=
 =?utf-8?B?bjh0M0NoeHMxRi81ald2TXR2TmVJblpGR1ZhZmxHc2o0allqVzUrOHlmSktq?=
 =?utf-8?B?T1BKQ3JEQ2JvMWdva1pKQTU4SFZyN0w2U1kwRGY0MWthYmJCa05HaEdNTW9U?=
 =?utf-8?B?QThta0tqcFVjdUxMSDNQM1lzQldVeDE5Vm52QytVV09JeG12dThla2NHbjNu?=
 =?utf-8?B?eDE4VWMvaXd4R3NRWStwNGROOEhha0pxZy9RRlBGT1N1YjFoZnVZcjlCZ25S?=
 =?utf-8?B?N1ByZVUySWo0U1M1eUdZR3ZjbnJRTk4zaXZwcEMzcmtBcmhUalhqQ3JIYUpw?=
 =?utf-8?B?dEp4MStnUkhISHlqQW81UGNHdG14QlIvTGd1bG1keU55dndJUnNIejRWcFJH?=
 =?utf-8?B?QmtycE5NWVdRbGJheC9HQUhpWlhtRzc2Z2ZKSTluelFIZkN5V2gxdGUzTUpk?=
 =?utf-8?B?WExmckdIcjhmb2V1YUxCdGlVdVh2TGJxRkpvSGhiMDd0TmgzaUlHT3FDcFVv?=
 =?utf-8?B?Smw3RkRKNnJoaDl2OGFkUXZ1Z0R3SlIwTE0yWWw0NWJBeExFQ08wYzRyQWpT?=
 =?utf-8?B?ZVRkdDBLWUt5QnR0L0llQnVMcVZJczl0THJFVEZqbzVHRktKNTNFc0s3Mjhk?=
 =?utf-8?B?UDNnZ1pZUU9QU0pxdUNvaTRLcDdqbzVrN1J6ekpDNjhwdE95cVl5RUN3TU5Z?=
 =?utf-8?B?SFhjZmJFM2FBczdMRCtCalR1cEIvQXl0RktNa3NTYm4zN3kvSTN4enlYeVVm?=
 =?utf-8?B?Mlo0QTRrVG5NUjJILzZ2dUpPMldzOVdJZDNBZTNuZ3NJUU40dTdWTmRGTTlk?=
 =?utf-8?B?Vk0zd2k5Sk5YQXBvOHF0SjcvajAvcTM4aEE2MkNPVXcvOU5uamNwZGZCOWhx?=
 =?utf-8?B?L2NNUzFrNkp6YTY4Tm5rU21yL01TYW5WaGFDeHE2RThKV3BPRHFIcnpRWGFq?=
 =?utf-8?B?TFR1MXJEOVZKNXBpZWlwVGVWY1d1NGc4RjBjdXNRcjVFbG9NY3QvQmhwNXo1?=
 =?utf-8?B?eGZtMXJSM09MWGFsWEY1MUhURERMUnRxdndmLytvMHBVTGpjZ1ZpZkE4NE5a?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F8F66D236A89A49BC87C90FF7B78DE2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bffe01b9-8176-4045-35f2-08db1e39b836
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 11:55:45.5430
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZB3wS7HGbGfFH3+Z0RDwVbhPS/WtKl+1tqtwaKpWLNZfd6BCY9Ie/cPlKdkhEuBF4OL5F6DNzgfNJb6A+s/DkkVNi6/7hea4DS8xja3LNAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5557
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMDMuMDMuMjAyMyAyMzozNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy93YXRjaGRvZy9hdDkxcm05MjAwX3dkdC5jIHwg
NiArKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9hdDkxcm05MjAwX3dkdC5j
IGIvZHJpdmVycy93YXRjaGRvZy9hdDkxcm05MjAwX3dkdC5jDQo+IGluZGV4IGQ1NzQwOWMxYTRk
MS4uZDIwZWMyN2JhMzU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL2F0OTFybTky
MDBfd2R0LmMNCj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9hdDkxcm05MjAwX3dkdC5jDQo+IEBA
IC0yNTgsNyArMjU4LDcgQEAgc3RhdGljIGludCBhdDkxd2R0X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAtc3RhdGlj
IGludCBhdDkxd2R0X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3Rh
dGljIHZvaWQgYXQ5MXdkdF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IHsNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAgICAgICAg
IGludCByZXM7DQo+IEBAIC0yNjksOCArMjY5LDYgQEAgc3RhdGljIGludCBhdDkxd2R0X3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiANCj4gICAgICAgICBtaXNjX2RlcmVn
aXN0ZXIoJmF0OTF3ZHRfbWlzY2Rldik7DQo+ICAgICAgICAgYXQ5MXdkdF9taXNjZGV2LnBhcmVu
dCA9IE5VTEw7DQo+IC0NCj4gLSAgICAgICByZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICBzdGF0aWMg
dm9pZCBhdDkxd2R0X3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IEBA
IC0yOTksNyArMjk3LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgYXQ5MV93ZHRfZHRfaWRz
KTsNCj4gDQo+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhdDkxd2R0X2RyaXZlciA9
IHsNCj4gICAgICAgICAucHJvYmUgICAgICAgICAgPSBhdDkxd2R0X3Byb2JlLA0KPiAtICAgICAg
IC5yZW1vdmUgICAgICAgICA9IGF0OTF3ZHRfcmVtb3ZlLA0KPiArICAgICAgIC5yZW1vdmVfbmV3
ICAgICA9IGF0OTF3ZHRfcmVtb3ZlLA0KPiAgICAgICAgIC5zaHV0ZG93biAgICAgICA9IGF0OTF3
ZHRfc2h1dGRvd24sDQo+ICAgICAgICAgLnN1c3BlbmQgICAgICAgID0gcG1fcHRyKGF0OTF3ZHRf
c3VzcGVuZCksDQo+ICAgICAgICAgLnJlc3VtZSAgICAgICAgID0gcG1fcHRyKGF0OTF3ZHRfcmVz
dW1lKSwNCj4gLS0NCj4gMi4zOS4xDQo+IA0KDQo=
