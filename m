Return-Path: <linux-watchdog+bounces-2671-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E674A0ADFC
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 04:41:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E115165F0D
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 03:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA03A8249F;
	Mon, 13 Jan 2025 03:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="cZ0Gtdku"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020093.outbound.protection.outlook.com [52.101.128.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EF3208CA;
	Mon, 13 Jan 2025 03:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736739681; cv=fail; b=JSkvbuJr68QOb+tPMQsVuOL4EgM1GJ4Vj/eKvvr7Nk69301S+obpr2nyPm6BXAi4VmD0OpLEY1KGWsC62+i1Lb79naySps5rPGCn+h33mxn33PK4DTYtsKq9mz0PxLrHew4jX7Mo/nrg01kjTDsWIn5haUJ5UlBk5zjE0QPSea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736739681; c=relaxed/simple;
	bh=RiImjXMgghba3j20uT4ui1Joq9V4QoyH5kS2ZsnoCU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hdi6wLzV2TB/POEMYLNZ8TvLWm6k8UtT63a+PvuG9EgRWqcaJij9qSk9QBoEFX5mesI6+nOi5FdqAeHC5hIUQ2KN5oo43/9zFRjXiylHjiGSN5tfAwGIy2lcUIc6IDD7llJ33HxksSUp8MD4cxKhuq9/eSpTpioZ05rwEiJrLbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=cZ0Gtdku; arc=fail smtp.client-ip=52.101.128.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6hMPRCvv+DNfefT6GhD7QmKHj+d2PnxtmP4tWV9zsBEz+W+RvEbL+KJ9fxNS7KvVcX5u9wV+2N93fuadebT1d6gQtVOFhRrQpX2npfxabOA9smXKGfxis5uxJ1ZAaVugV3nFErzWoCq8BWqIh+p3Sy9W2uWzx0bPqtE60JC+nauEAsoUMw1JxZuVmzVlIIWZDW7qT0nugO6P63j1IARDSfEI3Ht/9WqasMtr+A+D+97btjEx+4tfPHYbXaYy4GbHOC+1UCjzF28PK83Nat8jdNr9lsUwR7w7tUdSvYWogn+BGJdcC3dwSWNxmiU26CShsZoCtcEIpPN9zdOKm1FwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiImjXMgghba3j20uT4ui1Joq9V4QoyH5kS2ZsnoCU0=;
 b=ojWyI0BS/c6QjhhU73Fi6sDABqojoGlsUvDC19hoTOHfk4QMSwRfv//0JCtYwqaIgJzK6rDMqMadjOLDW3djEgmq1wlulQZ27lyFFHp2XySAwu4iwRAp8DxB+TxaN04Ne2MJNWnkHLIsMJla1U9MPUik2L4BkiMJzE37Yl0reKhTazTY0VmE9RxfotsjGj4/y2OTZKQRH5ccijx0wsnwVXQuCMAEkRlfVMEfBAgHOcGN6a6nQb7J+H/Zm4jyj707msR3y/NsChQH9xhrmPvQ82GId5pm2GJ5DKQ2Gx/GZAYjncIoq+W4+Ry1SF6LtA9+vD68PnqQJiVGYt8Lx04uxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiImjXMgghba3j20uT4ui1Joq9V4QoyH5kS2ZsnoCU0=;
 b=cZ0GtdkuIgZBHK7ulcGTF17vSeZtWlnzhFpPrhBwRwSmWHWMAGXci75OTu9aoxBf0TqRUIAMQgc5hHytEbyqdPCAFADLdOIBqNwQ63bu+DzLMomHTR0YDzZyVyvak1nWeJflVILIWm0BFO5mdWanahYqj2jHzOYxeoBOuegVpmuyXuzAejPNQvJNFNWHaUq64+d1xZLMKB4z9LNVjMHTndqUquoqutWi/BwyWGVfK2uFQZsfLcgl7p5hFHw9h65tYjJ6bIur3DUVmNg1+cbUlP1/m8pRIwcK/awUzluqpgC9ls0mro8u5+jCRIuxAFOm1KC1XS2JwqQXf+HYzx+Ejg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SI2PR06MB5194.apcprd06.prod.outlook.com (2603:1096:4:1be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.10; Mon, 13 Jan
 2025 03:41:12 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%5]) with mapi id 15.20.8356.010; Mon, 13 Jan 2025
 03:41:09 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>, BMC-SW
	<BMC-SW@aspeedtech.com>, "chnguyen@amperecomputing.com"
	<chnguyen@amperecomputing.com>, Aaron Lee <aaron_lee@aspeedtech.com>
Subject: RE: [PATCH v6 1/1] watchdog: aspeed: Update bootstatus handling
Thread-Topic: [PATCH v6 1/1] watchdog: aspeed: Update bootstatus handling
Thread-Index: AQHbZMmvS7sJs9+pQkGZdyhnA2INLLMUDOGAgAABQWA=
Date: Mon, 13 Jan 2025 03:41:09 +0000
Message-ID:
 <TYZPR06MB52032C46C1AB2C18B923A8E6B21F2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20250112081204.263216-1-chin-ting_kuo@aspeedtech.com>
	 <20250112081204.263216-2-chin-ting_kuo@aspeedtech.com>
 <b4fa429c6c7df899281d36f295b4431c90fe443c.camel@codeconstruct.com.au>
In-Reply-To:
 <b4fa429c6c7df899281d36f295b4431c90fe443c.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SI2PR06MB5194:EE_
x-ms-office365-filtering-correlation-id: 78f72929-ddba-41d2-1df7-08dd33841e96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aW5zSmg1S1U3dGlWWG5jZER0aUJvNUxsdHhNMDdlMTVyb0JRVVJQcXZlUXpO?=
 =?utf-8?B?UHVPeDE0TnY5QzRmaU1tOHNxampadW82cWJWTHZpNEFLMEIweCsvaUJrTDg0?=
 =?utf-8?B?Y0tjaW9KSkxIMk1yTkRHeXlvSmJlbjJuY2tzT2JCZlkrWDE3WE9RdHJsbEth?=
 =?utf-8?B?Z2R6NjkrMG8xUldlZGpDcnNZcktqN1Y1Qmd6cGYwbkdKK1FFYUFIcHo4SGVh?=
 =?utf-8?B?WFZ6YkRxeFN2OFNHTVBkRkN1c0IzblIydGJSYndhdUx6bmJ6U1JOdjhLcWV3?=
 =?utf-8?B?a0QyUExlN2wzSkoxRmVhalc0ejF4a01VZjIrd2lHT05uY21XWUpqVHgzVGU4?=
 =?utf-8?B?L010Z25Hc0lZL2lUMHFVVG5jSnVOOFUzMm1JQnJ6SmtPWGRIUDM4eDNTKzJ1?=
 =?utf-8?B?TUFqanFSU0YyYXJoMDY2YmlWTG5sZTFMbjJldExDdlNUaHJOQ0EwMjZxR1VG?=
 =?utf-8?B?T1dZZk5OOEpxK2hTcWhIQ3o3U0toU0ZqNDdieXZycXBaVXhKa1RxUVo5cUVs?=
 =?utf-8?B?bTZ4R2F4SDljd2xHT3I0a2sxSi9nTmRlK3JVOFFWcmViaWRiRiszTGlZSmpa?=
 =?utf-8?B?OTBaNHd4U0hzajZJSkFIVmxPTWhpTXpmNjZDMmMvanFycGdUS3c0dmlzZlFQ?=
 =?utf-8?B?ZTY2ck9NbGxUVlhwTzNnc0ViWGtHdFEyZXp4Y3I1em50V0pOa1lHd3BHcUM1?=
 =?utf-8?B?bjBSSFVKK1IvUFJCU1RVS2JyUGZRcDF0WGtlMUxXb2RnOWd3NmFGdlFQV3Mz?=
 =?utf-8?B?M09PNkE2dEx5c0lScjE1Ymx0ZGFxMGgzSlhUZWVBK0VubVI2SWhwRWJlZGh4?=
 =?utf-8?B?NmdmejBQTnp0cnEzNnVkdEtSK0dUWVdQZTZka2pqemNRSTVjUEhjVU1LbTJF?=
 =?utf-8?B?aEg2ZVRiUDNOVkNsVkxUQU1ERW5jaU1hMkt1U1Bic21NRmlNcktKQkhPb0Mw?=
 =?utf-8?B?YzRVUzJYb0FaZHFDblVaVk1jSUw5Qkx3SlVSampjQWNNd2poTDZqQUVEQTF5?=
 =?utf-8?B?QWRmbFoxQlhPWFJJWDZ2R1dBUW1EREdBdGxYTi9yMGE3cEFNMDFlM0dSNWZr?=
 =?utf-8?B?R2duTkNWSXpZQTlXbHJiMy93djRRTXUzMHNTbzdFaFlOamFtUmFCZ1ZMQXg0?=
 =?utf-8?B?OEZ5b2llSkhXNk5jcUNsN2MvbFh1RjFCMWk2VDEwc3J5dmUxNWVnMlpJRFFR?=
 =?utf-8?B?aE05ZVlzZW5iUThjN0hlR0tWWmpJZ1BzM1R0OGM1bzJkb3BHT2t3OW1zZy84?=
 =?utf-8?B?V2xuaWVPNXBTM3d5enRJSUtzN2xDTDl4OTVLZFZ5empnaGE0STJpUEVZSUpX?=
 =?utf-8?B?ZTVzNG9SdHZxSzdlWlk1eFdwS3l6dUlFejA2ZDhpWlNtUHJOLytoVEJoMitr?=
 =?utf-8?B?NEVhWWNwWU0vdHFINTJPOFcvYTBJSEpqZEF2LytpRnV6eDNLMXErejNFdGdF?=
 =?utf-8?B?a2U4Rk1TZDRuTmZrb3h1aEZlNC9HY1Z5cGtqdUFEeXdLeVpSZ1BZbXU2SWc3?=
 =?utf-8?B?MW85Q1p0Q29JeDR4Wnp4QkxjNld0KzVYRG9kKzFXN0ZXRUtSbGZMQTlidnlQ?=
 =?utf-8?B?QmFaTUV6ZUZSd3RScUZMQXQwTHF4MlQrZmVUODFET0NHMUhORjdZa0szNTU5?=
 =?utf-8?B?SCtTeWFJcVFzVThIOUFyTHUybEtMMjEyMm13cm5FREs1RFJJVkZJaHd4Y3BW?=
 =?utf-8?B?SEVoVkFUbHYwMEYzdlp4bGhwQ3kzUVphWW9Ecmo3aUlsaUpwQURDUStISUFk?=
 =?utf-8?B?MjdRbFZlbVJiYmhQejVhUDNrNnpvbVRSbGgyMWxTRzVZMDlnaGVZak5jN0pS?=
 =?utf-8?B?THVFNWMyTytGUW0vSWhNL1hGQ2xBa3VkVjFmSUtlYXF0MWJDNHBiNXZ2M3NQ?=
 =?utf-8?B?M1VQZ3BXZnVpczJkMkVKcnNJd1dJbS84ZnRoSDVYQXMyNS9BMEFxS0wwdUdv?=
 =?utf-8?Q?oM+SCl3LJe/sJEzBEynMVmtE4+U+h/30?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bC9RL2YxSHNXeGxYTTZMR0NCTHJLd0h6UGprMysxdlk2cVdtaUlhTVhTbHRS?=
 =?utf-8?B?N3AvSVUrZWlIWkNyR1ZRYUc0MXFqZFQ1MUJmVFMxelovRktCeFVBcVhYdkVR?=
 =?utf-8?B?djZPVEUrVW9SM3dWT21WTi8zT001Vko0OUVWMU9yZmM5SVR4OFZVdTliTlEy?=
 =?utf-8?B?dmx3R0RkeWY2aTRjSDkyUTQ1VHMyVzlCaGtaS1doVGFkQjRORGJxU2ZTZEdM?=
 =?utf-8?B?RkNKQWlQYzQwVk4xcWx0OFljbXVhT1dxNW1Nelp5d1NhN0I3eUZsTkRTM09V?=
 =?utf-8?B?RVp4Q1FFaFhkUFdRSGhrREhlZzVqOU5SQzJmcmUzQ0pkUmxBVlZUVGwzVE5z?=
 =?utf-8?B?eXI4WTFLdnEyZWZpNksyR0xUZUM0U3FyTW8vUEMrWWpNRlkzaDllSms5MUIv?=
 =?utf-8?B?QzM2Tm5kM3hlcVdtbTZoS3cvNDVpdWVxeDJoYkd1RXEwbk8rM3IxYm9NQVJ6?=
 =?utf-8?B?YXdwZlhsS25QUUxqWVRoZ0E5R3gxWGV5YkpINHZWOEhNVWpjSDg3WXdURTZJ?=
 =?utf-8?B?QkhPZ2dXV0tRNnFuQmJpZHRKeEtONUFDOWxka1gxV2t3cG5Od2tSQ3F0eHp4?=
 =?utf-8?B?dHZRMW1JczEzdVh0V3dsYThuVlJBYWJza0l1RU1yTElsUGpnemxEMWtRTUtD?=
 =?utf-8?B?T3VBVVJzeDc1N3N0QkVmMEZMVzIwYVJaT0I4REZVTTJRczdielVnTFJhMUV0?=
 =?utf-8?B?citZTnlEOEl5UjJLaVdUT2NJVWJvSGg4MVBYd1NDSWFMWDMzMlBlRURzaCtU?=
 =?utf-8?B?R1JQZG5VZUZ1cXdLY1piQ05lY0ZWczRIaHdQOUo3TU9wbWI2eUl6SDJiRGJ2?=
 =?utf-8?B?dG1LRTBZQmQ2UmcvTWtSUjhLd3VVS00rdHhadFdxWEVLZzRoQ0R5dzhJQk81?=
 =?utf-8?B?clUvVWFvZ1hHTDVKODFKV1hQU0cxa2xoWVlNV1FSV3NiU2ZkWVU2OTFrYVJY?=
 =?utf-8?B?MENpYzZ4VWdVSHRSSFowc0t4ZzZqaXBrbnZwQUU2a0FsUUk2TzFlb2htMWhI?=
 =?utf-8?B?cmZOdGRCWmhiNWhiRkJQUU5xemFGZHptSHduWUdCb2kxdXVTUUtnUXpHcUh2?=
 =?utf-8?B?V08xaG85S1hCZmlBeEZkSWQvWU5WeGxRdWtRcU1GaFZEVUNPbDQ1V0hLMG5O?=
 =?utf-8?B?SnhDU1ZrK3ovRWF0TmsrWjJySFpDU3JzWUZKemNOMlNURlp6aHlEK2NJamdi?=
 =?utf-8?B?bjRBQzBkM1dERnIrK2tsZmdYSFEvUDlPZCsvc3Y5clJnWHhwVVRkWkRtVWJF?=
 =?utf-8?B?bE1CSVJ2eEdlRC9ITXh0VEdSLy9YNGhYdEI4WDdGbHFIZWI2dGgxTjZzWDVK?=
 =?utf-8?B?ZExzb01IRjd0RlI4NEEyZWRvZzRWdklaYW9pYTlIZmZyTU1VSUF6VTJVejdB?=
 =?utf-8?B?bW04WWRVK2NRSytlQ25mRHJ4UDZHOFQxK29OK0JPekxqYTVvaWZ6ZHVLQUpO?=
 =?utf-8?B?ZXY3YkpDUDQ3UFg1UTg0Z2d5VmJxK1N5WnN4UEF5czdPeVUwRERIbzZGYUFO?=
 =?utf-8?B?WStBdzU0ZWMrc2toV2FITFpnVVl1RkpMckZrREpmWHJ1ME5EancvbFp2SnJH?=
 =?utf-8?B?dTFSMzZsWEl5NHlqNngxQno2bGtPRzhxSTQ0eSszWHBwbXl6TzliaHRiQ1p5?=
 =?utf-8?B?ZTFQdUo5UG9oWFB0eWNoRmJYM0hHeW5RcFp0akV3SnBnR3pHOVRET1daM3RR?=
 =?utf-8?B?dzN5TzErK3dyVWJsN3QvLzNaZS85OXordUhsVUs4YzRHRS9saDZTY0JoTFE4?=
 =?utf-8?B?OW8xbytJb0d2b3N4My82M3cxZnVBSVJZY0trOEJaSjJLaXdYbStxTVdzUG1o?=
 =?utf-8?B?cTdMR1VsbnRya2R6aW4xQjVoaTJYWVpTdDVZcnZabGRETlBTVjI0R1FiWWtT?=
 =?utf-8?B?MWh5ais1SkZibjN0SkEwVWc4WXlFZWdYQUdDemxxU0FXSWtiSUkxY29aa0Vk?=
 =?utf-8?B?bUhHQUYvSWxTTE1PMVdoVUdHa25JVEFmM2xGUms1L1VYczlkWTRtYjR1MmJQ?=
 =?utf-8?B?bk8zOG5KQktQUGRRM0pOVjgwaHZSY0dmV2g2V04wbEZEbk5iekRsaTFrUEp6?=
 =?utf-8?B?V2Q2ZEhtUmg0ODdReitVWjZISXVaRjllZWdYWUlZVWdWdEVVWlE0YjZxTUQ1?=
 =?utf-8?B?aklPakp3UkR3bmVZd2Uwd0tJYXNtUkpsNXZQM0hmRmFCVUhhWnZybUc4UkND?=
 =?utf-8?B?RkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f72929-ddba-41d2-1df7-08dd33841e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 03:41:09.8122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V4zCJjtyW5AJKYVPUQx1cTwnnqW2gAz9CntUeouthxeu8laVqRSFb8PKGkhXoe5cFvpAgZzicAYX4man7HBAxWnOG8ehPtTYqNH9kqE+b3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5194

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IFNlbnQ6IE1vbmRheSwg
SmFudWFyeSAxMywgMjAyNSAxMToyOSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvMV0g
d2F0Y2hkb2c6IGFzcGVlZDogVXBkYXRlIGJvb3RzdGF0dXMgaGFuZGxpbmcNCj4gDQo+IE9uIFN1
biwgMjAyNS0wMS0xMiBhdCAxNjoxMiArMDgwMCwgQ2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPiBU
aGUgYm9vdCBzdGF0dXMgaW4gdGhlIHdhdGNoZG9nIGRldmljZSBzdHJ1Y3QgaXMgdXBkYXRlZCBk
dXJpbmcNCj4gPiBjb250cm9sbGVyIHByb2JlIHN0YWdlLiBBcHBsaWNhdGlvbiBsYXllciBjYW4g
Z2V0IHRoZSBib290IHN0YXR1cw0KPiA+IHRocm91Z2ggdGhlIGNvbW1hbmQsIGNhdCAvc3lzL2Ns
YXNzL3dhdGNoZG9nL3dhdGNoZG9nWC9ib290c3RhdHVzLg0KPiA+IFRoZSBib290c3RhdHVzIGNh
biBiZSwNCj4gPiBXRElPRl9DQVJEUkVTRVQgPT4gdGhlIHN5c3RlbSBpcyByZXNldCBieSBXRFQg
U29DIHJlc2V0Lg0KPiA+IE90aGVyc8KgwqDCoMKgwqDCoMKgwqDCoCA9PiBvdGhlciByZXNldCBl
dmVudHMsIGUuZy4sIHBvd2VyIG9uIHJlc2V0Lg0KPiA+DQo+ID4gT24gQVNQRUVEIHBsYXRmb3Jt
LCB0aGUgYm9vdCBzdGF0dXMgaXMgcmVjb3JkZWQgaW4gdGhlIFNDVSByZWdpc3RlcnMuDQo+ID4g
LSBBU1QyNDAwOiBPbmx5IGEgYml0IHJlcHJlc2VudHMgZm9yIGFueSBXRFQgcmVzZXQuDQo+ID4g
LSBBU1QyNTAwL0FTVDI2MDA6IFRoZSByZXNldCB0cmlnZ2VyZWQgYnkgZGlmZmVyZW50IFdEVCBj
b250cm9sbGVycw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYW4g
YmUgZGlzdGluZ3Vpc2hlZCBieSBkaWZmZXJlbnQgU0NVIGJpdHMuDQo+ID4NCj4gPiBCZXNpZGVz
LCBvbiBBU1QyNDAwIGFuZCBBU1QyNTAwLCBzaW5jZSBhbHRlcm5hdGluZyBib290IGV2ZW50IGlz
DQo+ID4gdHJpZ2dlcmVkIGJ5IFdEVCBTb0MgcmVzZXQsIGl0IGlzIGNsYXNzaWZpZWQgYXMgV0RJ
T0ZfQ0FSRFJFU0VULg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpbi1UaW5nIEt1byA8Y2hp
bi10aW5nX2t1b0Bhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvd2F0Y2hk
b2cvYXNwZWVkX3dkdC5jIHwgODENCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMN
Cj4gPiBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jIGluZGV4IGI0NzczYTZhYWY4Yy4u
MzY5NjM1YjM4Y2EwDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy93YXRjaGRvZy9hc3Bl
ZWRfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93ZHQuYw0KPiA+IEBA
IC0xMSwyMSArMTEsMzAgQEANCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9pby5oPg0KPiA+IMKgI2lu
Y2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L2tzdHJ0b3guaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21mZC9zeXNjb24uaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4NCj4gPiDCoCNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiA+IMKgI2luY2x1ZGUg
PGxpbnV4L29mX2lycS5oPg0KPiA+IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ID4gwqAjaW5jbHVkZSA8bGludXgv
d2F0Y2hkb2cuaD4NCj4gPg0KPiA+IMKgc3RhdGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19O
T1dBWU9VVDsNCj4gPiDCoG1vZHVsZV9wYXJhbShub3dheW91dCwgYm9vbCwgMCk7DQo+ID4gwqBN
T0RVTEVfUEFSTV9ERVNDKG5vd2F5b3V0LCAiV2F0Y2hkb2cgY2Fubm90IGJlIHN0b3BwZWQgb25j
ZQ0KPiBzdGFydGVkDQo+ID4gKGRlZmF1bHQ9Ig0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBfX01PRFVMRV9TVFJJTkco
V0FUQw0KPiBIRE9HX05PV0FZT1VUKQ0KPiA+ICIpIik7DQo+ID4gK3N0cnVjdCBhc3BlZWRfd2R0
X3NjdSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3QgY2hhciAqY29tcGF0aWJsZTsNCj4gPiAr
wqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfc3RhdHVzX3JlZzsNCj4gPiArwqDCoMKgwqDCoMKgwqB1
MzIgd2R0X3Jlc2V0X21hc2s7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTMyIHdkdF9yZXNldF9tYXNr
X3NoaWZ0Ow0KPiA+ICt9Ow0KPiA+DQo+ID4gwqBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25maWcgew0K
PiA+IMKgwqDCoMKgwqDCoMKgwqB1MzIgZXh0X3B1bHNlX3dpZHRoX21hc2s7DQo+ID4gwqDCoMKg
wqDCoMKgwqDCoHUzMiBpcnFfc2hpZnQ7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiBpcnFfbWFz
azsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYXNwZWVkX3dkdF9zY3Ugc2N1Ow0KPiA+IMKg
fTsNCj4gPg0KPiA+IMKgc3RydWN0IGFzcGVlZF93ZHQgew0KPiA+IEBAIC0zOSwxOCArNDgsMzYg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZw0KPiA+IGFzdDI0MDBfY29u
ZmlnID0gew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZm
LA0KPiA+IMKgwqDCoMKgwqDCoMKgwqAuaXJxX3NoaWZ0ID0gMCwNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgLmlycV9tYXNrID0gMCwNCj4gPiArwqDCoMKgwqDCoMKgwqAuc2N1ID0gew0KPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjQwMC1z
Y3UiLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAucmVzZXRfc3RhdHVzX3Jl
ZyA9IDB4M2MsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC53ZHRfcmVzZXRf
bWFzayA9IDB4MSwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLndkdF9yZXNl
dF9tYXNrX3NoaWZ0ID0gMSwNCj4gPiArwqDCoMKgwqDCoMKgwqB9LA0KPiA+IMKgfTsNCj4gPg0K
PiA+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNTAwX2NvbmZp
ZyA9IHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmV4dF9wdWxzZV93aWR0aF9tYXNrID0gMHhmZmZm
ZiwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgLmlycV9zaGlmdCA9IDEyLA0KPiA+IMKgwqDCoMKgwqDC
oMKgwqAuaXJxX21hc2sgPSBHRU5NQVNLKDMxLCAxMiksDQo+ID4gK8KgwqDCoMKgwqDCoMKgLnNj
dSA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLmNvbXBhdGlibGUgPSAi
YXNwZWVkLGFzdDI1MDAtc2N1IiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LnJlc2V0X3N0YXR1c19yZWcgPSAweDNjLA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAud2R0X3Jlc2V0X21hc2sgPSAweDEsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoC53ZHRfcmVzZXRfbWFza19zaGlmdCA9IDIsDQo+ID4gK8KgwqDCoMKgwqDCoMKgfSwN
Cj4gPiDCoH07DQo+ID4NCj4gPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3dkdF9jb25m
aWcgYXN0MjYwMF9jb25maWcgPSB7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5leHRfcHVsc2Vfd2lk
dGhfbWFzayA9IDB4ZmZmZmYsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoC5pcnFfc2hpZnQgPSAwLA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqAuaXJxX21hc2sgPSBHRU5NQVNLKDMxLCAxMCksDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgLnNjdSA9IHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtc2N1IiwNCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLnJlc2V0X3N0YXR1c19yZWcgPSAweDc0LA0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAud2R0X3Jlc2V0X21hc2sgPSAweGYsDQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC53ZHRfcmVzZXRfbWFza19zaGlmdCA9IDE2LA0KPiA+ICvC
oMKgwqDCoMKgwqDCoH0sDQo+ID4gwqB9Ow0KPiA+DQo+ID4gwqBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBhc3BlZWRfd2R0X29mX3RhYmxlW10gPSB7IEBAIC0yMTMsNg0KPiA+ICsy
NDAsNTYgQEAgc3RhdGljIGludCBhc3BlZWRfd2R0X3Jlc3RhcnQoc3RydWN0IHdhdGNoZG9nX2Rl
dmljZSAqd2RkLA0KPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsNCj4gPiDCoH0NCj4gPg0K
PiA+ICtzdGF0aWMgdm9pZCBhc3BlZWRfd2R0X3VwZGF0ZV9ib290c3RhdHVzKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UNCj4gPiAqcGRldiwNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dA0KPiBhc3BlZWRfd2R0ICp3ZHQpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgYXNwZWVkX3dkdF9zY3Ug
c2N1ID0gd2R0LT5jZmctPnNjdTsNCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgcmVnbWFwICpz
Y3VfYmFzZTsNCj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfbWFza193aWR0aDsNCj4gPiAr
wqDCoMKgwqDCoMKgwqB1MzIgcmVzZXRfbWFza19zaGlmdDsNCj4gPiArwqDCoMKgwqDCoMKgwqB1
MzIgaWR4ID0gMDsNCj4gPiArwqDCoMKgwqDCoMKgwqB1MzIgc3RhdHVzOw0KPiA+ICvCoMKgwqDC
oMKgwqDCoGludCByZXQ7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghb2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsDQo+ID4gImFzcGVlZCxhc3QyNDAwLXdk
dCIpKSB7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LA0KPiBJT1JFU09VUkNFX01FTSwgMCk7DQo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlkeCA9ICgoaW50cHRyX3Qpd2R0LT5iYXNlICYgMHgwMDAw
MGZmZikgLw0KPiA+IHJlc291cmNlX3NpemUocmVzKTsNCj4gPiArwqDCoMKgwqDCoMKgwqB9DQo+
ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoHNjdV9iYXNlID0NCj4gPiBzeXNjb25fcmVnbWFwX2xv
b2t1cF9ieV9jb21wYXRpYmxlKHNjdS5jb21wYXRpYmxlKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoSVNfRVJSKHNjdV9iYXNlKSkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB3ZHQtPndkZC5ib290c3RhdHVzID0gV0RJT1NfVU5LTk9XTjsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0NCj4gPiArDQo+
ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gcmVnbWFwX3JlYWQoc2N1X2Jhc2UsIHNjdS5yZXNldF9z
dGF0dXNfcmVnLCAmc3RhdHVzKTsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KSB7DQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdkdC0+d2RkLmJvb3RzdGF0dXMgPSBXRElP
U19VTktOT1dOOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47DQo+
ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqByZXNldF9tYXNr
X3dpZHRoID0gaHdlaWdodDMyKHNjdS53ZHRfcmVzZXRfbWFzayk7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgcmVzZXRfbWFza19zaGlmdCA9IHNjdS53ZHRfcmVzZXRfbWFza19zaGlmdCArDQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2V0X21h
c2tfd2lkdGggKiBpZHg7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChzdGF0dXMgJiAo
c2N1LndkdF9yZXNldF9tYXNrIDw8IHJlc2V0X21hc2tfc2hpZnQpKQ0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB3ZHQtPndkZC5ib290c3RhdHVzID0gV0RJT0ZfQ0FSRFJFU0VU
Ow0KPiANCj4gSG93IHByZWNpc2UgaXMgdGhlIHdvcmRpbmcgaW4geW91ciBjb21taXQgbWVzc2Fn
ZT8gVGhlIEFTVDI2MDAsIGZvcg0KPiBpbnN0YW5jZSwgaGFzIDQgcmVzZXQgdHlwZXM6DQo+IA0K
PiAxLiAiU29DIg0KPiAyLiAiRnVsbCINCj4gMy4gIkFSTSINCj4gNC4gIlNvZnR3YXJlIg0KPiAN
Cj4gSW4gdGhlIGNvbW1pdCBtZXNzYWdlLCB5b3Ugc2FpZDoNCj4gDQo+ID4gV0RJT0ZfQ0FSRFJF
U0VUID0+IHRoZSBzeXN0ZW0gaXMgcmVzZXQgYnkgV0RUIFNvQyByZXNldC4NCj4gDQoNClRoZSBj
b21taXQgbWVzc2FnZSBzaG91bGQgYmUgY2hhbmdlZCBmb3IgbW9yZSBwcmVjaXNlbHkuDQoiV0RJ
T0ZfQ0FSRFJFU0VUID0+IHRoZSBzeXN0ZW0gaXMgcmVzZXQgZHVlIHRvIFdEVCB0aW1lb3V0IG9j
Y3Vycy4iDQpUaGlzIGNoYW5nZSBjYW4gYmUgdXBkYXRlZCB3aXRoIGEgbmV3IHBhdGNoIHZlcnNp
b24uDQoNCj4gSG93ZXZlciB0aGUgbG9naWMgaGVyZSAod2l0aCB0aGUgd2F5IHlvdSd2ZSBpbml0
aWFsaXNlZCB0aGUgY29uZmlnIHN0cnVjdCBmb3IgdGhlDQo+IEFTVDI2MDApIHdpbGwgc2lnbmFs
IFdESU9GX0NBUkRSRVNFVCBldmVuIGlmIHdoYXQgb2NjdXJyZWQgd2FzIGUuZy4gYQ0KPiAoZ3Jh
Y2VmdWw/KSBzb2Z0d2FyZSByZXNldC4NCj4gDQoNCkFzIHRoZSBkaXNjdXNzaW9uIGluIHRoZSBw
cmV2aW91cyBwYXRjaCBzZXJpZXMsIHRoZXJlIGlzIG5vIGNvbnNlbnN1cyBmb3IgZ3JhY2VmdWwN
CnJlc2V0IGZsYWcgaW4gV0RUIGZyYW1ld29yay4gVGh1cywgdGhpcyBwYXRjaCBvbmx5IGRpc3Rp
bmd1aXNoZXMgV0RUIHJlc2V0IGZyb20NCm90aGVyIHJlc2V0IHJlYXNvbnMuDQoNCj4gVGhlIG9u
bHkgdGhpbmcgV0RJT0ZfQ0FSRFJFU0VUIGRpZmZlcmVudGlhdGVzIGlzIGEgcG93ZXItb24gcmVz
ZXQgZnJvbSBhbnkNCj4gb3RoZXIga2luZCBvZiB3YXRjaGRvZy1kcml2ZW4gcmVzZXQuDQo+IA0K
DQpZZXMuDQoNCj4gSXMgdGhhdCB3aGF0J3MgaW50ZW5kZWQ/IEknbSBqdXN0IHdhcnkgb2YgY29u
ZnVzaW9uIGZvciB3aGF0IGFwcGVhcnMgdG8gYmUgYQ0KPiBnZW5lcmljIHVzZSBvZiAiU29DIiBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgdnMgdGhlIHNwZWNpZmljICJTb0MiDQo+IG1vZGUgb2YgdGhl
IHdhdGNoZG9nIGNvbnRyb2xsZXIgKHNob3VsZCBzb21lIGRvY3VtZW50YXRpb24gYmUNCj4gd3Jp
dHRlbi91cGRhdGVkPykNCj4gDQoNClRoZSBjb21taXQgbWVzc2FnZSBjYW4gYmUgdXBkYXRlZC4N
Cg0KQ2hpbi1UaW5nDQo=

