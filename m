Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507822A2408
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Nov 2020 06:19:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgKBFTb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Nov 2020 00:19:31 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:21021 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726012AbgKBFTa (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Nov 2020 00:19:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604294369; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gglt99q78xy/igDy1zLL7gXHfXLy4ocv/EgOgW7lIEA=; b=Egte3jPT+8fseONk2Wqqm81RxPvbhD47phONmP/TZU0631OzXPeTR1zdAc9R4q3k1CmWU5tF
 MgVSHhUMDPCqFNmzvvDCueeFs0hTl/QcRhMwF/gvDdKmHpDDyvqvJrxNpEhRpUpZRVUn8Qxq
 QzeYg5uCtnP0HKMp2UK1zVfUif0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJmNTk5OSIsICJsaW51eC13YXRjaGRvZ0B2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f9f96d91df7f5f83c9022cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 02 Nov 2020 05:19:21
 GMT
Sender: kathirav=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 27F65C433C8; Mon,  2 Nov 2020 05:19:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.43.11] (unknown [223.182.216.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9FC19C433C6;
        Mon,  2 Nov 2020 05:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FC19C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kathirav@codeaurora.org
Subject: Re: [PATCH v4] watchdog: qcom_wdt: set WDOG_HW_RUNNING bit when
 appropriate
To:     Guenter Roeck <linux@roeck-us.net>,
        Robert Marko <robert.marko@sartura.hr>, agross@kernel.org,
        bjorn.andersson@linaro.org, wim@linux-watchdog.org,
        linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Luka Perkov <luka.perkov@sartura.hr>
References: <20201031121115.542752-1-robert.marko@sartura.hr>
 <a71307f5-22b4-0d38-2880-96084bb07275@roeck-us.net>
 <23aea80f-265b-8a23-e8ea-f46639dd4129@codeaurora.org>
 <5b7def39-8c23-d30f-e2d3-bc38beee8919@roeck-us.net>
From:   Kathiravan T <kathirav@codeaurora.org>
Message-ID: <dedebcc4-1c1f-bd56-07a6-ff7f44c06ed1@codeaurora.org>
Date:   Mon, 2 Nov 2020 10:49:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <5b7def39-8c23-d30f-e2d3-bc38beee8919@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On 11/2/2020 10:33 AM, Guenter Roeck wrote:
> On 11/1/20 7:58 PM, Kathiravan T wrote:
>> On 10/31/2020 7:38 PM, Guenter Roeck wrote:
>>> On 10/31/20 5:11 AM, Robert Marko wrote:
>>>> If the watchdog hardware is enabled/running during boot, e.g.
>>>> due to a boot loader configuring it, we must tell the
>>>> watchdog framework about this fact so that it can ping the
>>>> watchdog until userspace opens the device and takes over
>>>> control.
>>>>
>>>> Do so using the WDOG_HW_RUNNING flag that exists for exactly
>>>> that use-case.
>>>>
>>>> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Thanks for addressing the comments and now the patch looks good to me. One more suggestion, can we make the initcall level of the driver to subsys_initcall_sync so that the driver gets registered immediately after the watchdog_core is registered and watchdog_core starts pinging the WDT?
>>
> That would mean to replace module_platform_driver(), which would be a whole
> different discussion, is not widely needed, and would potentially interfere
> with the subsys_initcall_sync() in the watchdog core. This will require
> specific evidence that a problem is seen in the field, and that it is truly
> needed. Plus, it would have to be a different patch (which you could submit
> yourself, with evidence). Let's stick with one logical change per patch,
> please.
>
> Guenter
Yeah, of course I don't want to squash the initcall level change with 
this one. Just made a suggestion to consider it. Anyway I will try to 
collect some data and post the patch by own on that suggestion. Thanks 
Guenter.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

