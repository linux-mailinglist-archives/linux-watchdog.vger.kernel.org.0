Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 421E912960
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 May 2019 09:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbfECH7D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 May 2019 03:59:03 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:31868 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725775AbfECH7D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 May 2019 03:59:03 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x437wN7I012786;
        Fri, 3 May 2019 09:58:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=t609rofuUjW2NaRBXFT3b4myx0XAd7PIRxpvzFY38QQ=;
 b=DVHzpus37rY9JnLDJSXa/PljnopKkvOOCeWw6Quita8INxNmef1CzUgFEqXWnlT3uiis
 CB93ldPnYWNUARNN5GQnw8QEwTHKUcpR7HEqpx2jbC9W8VR7WddSEVW8ogweLzgqxu5F
 KKM7sAlBEvByGX0cJz2fRssR7ydbq+iPz1hvCzbRrsk4Bj7fv7gpk6FOJjMdZS5CxW4c
 dLxVQOxaSCo+5kbKP0J0g9NUXDN4IZCT3oqiAU4RDATlsSinClsIravJHEi6kNShKnHt
 Q8rZ9p7FrN95/uEdTSbnyu+DjIv/x6e7dufFvkRupdP4TumB5nNXoEoairloIAV6OhXi Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2s6xhbn0v7-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Fri, 03 May 2019 09:58:34 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3810231;
        Fri,  3 May 2019 07:58:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BD3D142E;
        Fri,  3 May 2019 07:58:33 +0000 (GMT)
Received: from [10.48.0.237] (10.75.127.47) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 May
 2019 09:58:32 +0200
Subject: Re: [PATCH V2 1/3] watchdog: stm32: update to
 devm_watchdog_register_device
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <1556806126-15890-1-git-send-email-ludovic.Barre@st.com>
 <1556806126-15890-2-git-send-email-ludovic.Barre@st.com>
 <20190502202122.GA27894@roeck-us.net>
From:   Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <f649441e-b3fe-134d-9dea-ac7140fb2d9d@st.com>
Date:   Fri, 3 May 2019 09:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190502202122.GA27894@roeck-us.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-03_03:,,
 signatures=0
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

hi Guenter

On 5/2/19 10:21 PM, Guenter Roeck wrote:
> On Thu, May 02, 2019 at 04:08:44PM +0200, Ludovic Barre wrote:
>> From: Ludovic Barre <ludovic.barre@st.com>
>>
>> This patch updates to devm_watchdog_register_device interface
>>
> Not that easy. See below.
> 
> A more complete solution is at
> https://patchwork.kernel.org/patch/10894355
> 
> I have a total of three patches for this driver pending for
> the next kernel release. Maybe it would make sense to (re-)
> start this series from there after the next commit window
> closes.
> 

I used the repository defined in MAINTAINERS file
git://www.linux-watchdog.org/linux-watchdog.git
but there is no next branch.

Today, I see your kernel.org repository
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/

And I see your next branch, so I will use it.

Regards,
Ludo

> Guenter
> 
>> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
>> ---
>>   drivers/watchdog/stm32_iwdg.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
>> index e00e3b3..e191bd8 100644
>> --- a/drivers/watchdog/stm32_iwdg.c
>> +++ b/drivers/watchdog/stm32_iwdg.c
>> @@ -243,7 +243,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>>   		dev_warn(&pdev->dev,
>>   			 "unable to set timeout value, using default\n");
>>   
>> -	ret = watchdog_register_device(wdd);
>> +	ret = devm_watchdog_register_device(&pdev->dev, wdd);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "failed to register watchdog device\n");
>>   		goto err;
>> @@ -263,7 +263,6 @@ static int stm32_iwdg_remove(struct platform_device *pdev)
>>   {
>>   	struct stm32_iwdg *wdt = platform_get_drvdata(pdev);
>>   
>> -	watchdog_unregister_device(&wdt->wdd);
>>   	clk_disable_unprepare(wdt->clk_lsi);
>>   	clk_disable_unprepare(wdt->clk_pclk);
> 
> This disables the clock while the watchdog is still registered
> and running. That is not a good idea.
> 
>>   
>> -- 
>> 2.7.4
>>
