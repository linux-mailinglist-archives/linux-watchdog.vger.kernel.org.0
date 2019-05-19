Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74222F87
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 10:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731707AbfETI52 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 04:57:28 -0400
Received: from mail-eopbgr790071.outbound.protection.outlook.com ([40.107.79.71]:49499
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725372AbfETI52 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 04:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/I2IOcfCdoLtEtu5whIie2xuMpHhmpQaGf4cPYlTNI=;
 b=2mHq/UNpOUVjGzQyXj8rkBaJCZ6/GFlFp7yKd8hoHWQp6HtzzaN5IdkxwRapI7GTZhdV4pMxScJFsH3zgepi71Qhlec8Bv2NvLSduHKlNMmyO2X+wShCypULnftm69SFuAMyhDGkqMuPJrcdM5T7pJoUcroAjTT0s0kFoQhD+jk=
Received: from DM6PR02CA0022.namprd02.prod.outlook.com (2603:10b6:5:1c::35) by
 MWHPR02MB2686.namprd02.prod.outlook.com (2603:10b6:300:106::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1900.16; Mon, 20 May
 2019 08:57:25 +0000
Received: from CY1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by DM6PR02CA0022.outlook.office365.com
 (2603:10b6:5:1c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1900.16 via Frontend
 Transport; Mon, 20 May 2019 08:57:24 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; sang-engineering.com; dkim=none (message not
 signed) header.d=none;sang-engineering.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT052.mail.protection.outlook.com (10.152.74.123) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1900.16
 via Frontend Transport; Mon, 20 May 2019 08:57:23 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:43633 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hSe6l-0003yW-FM; Mon, 20 May 2019 01:57:23 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1hSe6g-0005CQ-Bn; Mon, 20 May 2019 01:57:18 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x4K8vFBT009853;
        Mon, 20 May 2019 01:57:16 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1hSe6d-0005Bt-Lv; Mon, 20 May 2019 01:57:15 -0700
Subject: Re: [PATCH 29/46] watchdog: of_xilinx_wdt: drop warning after
 registering device
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-30-wsa+renesas@sang-engineering.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <c68b0700-10e5-f2a3-f4e9-338ac7cf7e47@xilinx.com>
Date:   Sun, 19 May 2019 10:57:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190518212801.31010-30-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39850400004)(346002)(376002)(396003)(136003)(2980300002)(189003)(199004)(54906003)(64126003)(305945005)(31696002)(63266004)(186003)(26005)(77096007)(47776003)(65956001)(65806001)(9786002)(5660300002)(50466002)(6666004)(356004)(478600001)(316002)(230700001)(44832011)(58126008)(36756003)(4744005)(106002)(81156014)(81166006)(8676002)(446003)(2906002)(2616005)(8936002)(476003)(11346002)(426003)(126002)(2486003)(52146003)(76176011)(23676004)(486006)(36386004)(31686004)(229853002)(6246003)(107886003)(65826007)(4326008)(70206006)(336012)(70586007)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2686;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8afde37-808e-4646-a1d0-08d6dd012d30
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);SRVR:MWHPR02MB2686;
X-MS-TrafficTypeDiagnostic: MWHPR02MB2686:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB2686EF80050628F81455ADD3C6060@MWHPR02MB2686.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-Forefront-PRVS: 004395A01C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b6Qw9Ka/NYEaGpqHvFs3ZWcUuiwZhDclBJASFDsdXroENWQ5u+xW1UOAsFtsqzOFs4y9e7d4LCxjTfZd4ahgNZJvMQxySN8YryF8hLSIddk4Vce6qNtPpQg5wrXEhf+w7j111RG9j/GA0ABl5QxVdq2po9vb8umQhNTMMdMHJHZ2N5EKDX/hAhP2GOSpAOxiiO6EgTOzdMjiamhjEonm249zVJIovhYshRirAIktR4XPRY9IEMoV7rFrrNaq+P4smd4ir5l9Osd6ez7gV3Y8Qf/uFBDVPjBCJyLgm4kwLNeWSPVZNY+VlexcqrKIpAVbD1+95cFhZkSjXck6iAqNKlA8wbdUfQHmXcYPOGBzKj7WKDddijVtO7OGPxAqQ0bXkC3rA7nkheSum0NlQnbsV7rkRuucm0wBrcuL4h47Oxs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2019 08:57:23.9103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8afde37-808e-4646-a1d0-08d6dd012d30
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2686
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 18. 05. 19 14:27, Wolfram Sang wrote:
> The core will print out details now.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/of_xilinx_wdt.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
> index 03786992b701..7fe4f7c3f7ce 100644
> --- a/drivers/watchdog/of_xilinx_wdt.c
> +++ b/drivers/watchdog/of_xilinx_wdt.c
> @@ -238,10 +238,8 @@ static int xwdt_probe(struct platform_device *pdev)
>  	}
>  
>  	rc = devm_watchdog_register_device(dev, xilinx_wdt_wdd);
> -	if (rc) {
> -		dev_err(dev, "Cannot register watchdog (err=%d)\n", rc);
> +	if (rc)
>  		return rc;
> -	}
>  
>  	clk_disable(xdev->clk);
>  
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

