Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91D2B72C40
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jul 2019 12:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfGXKSl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Jul 2019 06:18:41 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38460 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfGXKSl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Jul 2019 06:18:41 -0400
Received: by mail-pl1-f195.google.com with SMTP id az7so21812266plb.5
        for <linux-watchdog@vger.kernel.org>; Wed, 24 Jul 2019 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3L8JeUZGb+F+ttI1sQOEpuslmU4h8bluFrM3ypcxkac=;
        b=rlkRoja+VesapyR6xJmixRz0fOkDO78tO2BLm8uv80Y2zDPrPbQy1advi2rQU+lX4h
         g23YlHMLA5AIPq2AuwDwJYbL1O9lC1UT1QCZGycOiJ6d3DWMR5WfTQX0+gyjyIzj9JDn
         1P3ACbUfXSpHQeV9WcxpFi0P/yHX3SWYgGOM09P9Xj9LOJnvuBmjT60RjGwEzLakw+aA
         YovH5i9Kjt9hdjrlvvmoY0L6ouVpbz5qTD7H59GXJeC6ZEmoAClRwqNvIT5JkXf1ri+p
         EicRsdb/AzpFVILqVkBDfd9DhJ7bownCsvV6QtcGoQpLlcELpMhvedj7JsnFBhw2oT+8
         qTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3L8JeUZGb+F+ttI1sQOEpuslmU4h8bluFrM3ypcxkac=;
        b=VidlM7XIy56X2ZE17sfjkDSqHAI84R280JzOrm6UyvyJc4w5KaRnUL7T0lmxhUM2hh
         BjvuoQkB42sJE39cWXx5arncByWuCVj4H9xSlKIl0od/vDaxBpRray61glTlnWB4er3a
         EPd7+ST4U24MaD2cDoSiaWhQvmD1hrMaTomhEG3s5ir2vibxv3J6/twt5laMpQrOH5r1
         4WYwOQrB1mgYjaId4yL++W2tGdt9JQaMoWLE78+aXGSU9H0k8TnOVvV0n8ZzOiol/9aX
         IhHHDZDnOTe63TIR+ul7Pp4KLyR+v0YAOdvKoCjdl57p4oKAAhNFb0C39GH2d0RnAe/d
         cpeQ==
X-Gm-Message-State: APjAAAWVR71MqLJyxpbTwaJhQ0F5ptLpNK7fQ9qxLc2Q/IoMOUg1VRkt
        9YeBqImYjwKn/HTbxAIJ4LVuGwMq
X-Google-Smtp-Source: APXvYqzQg0pS2Qj6MMeKOS3z8wv4xx+1KOMO9XLLv4hbySR/dlVXY+55qO0vcF8IpgVE0CNdzbxl0w==
X-Received: by 2002:a17:902:aa5:: with SMTP id 34mr88053439plp.166.1563963519984;
        Wed, 24 Jul 2019 03:18:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r12sm17655004pgb.73.2019.07.24.03.18.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Jul 2019 03:18:39 -0700 (PDT)
Subject: Re: iTCO_wdt on Intel NUC
To:     =?UTF-8?Q?Valentin_Vidi=c4=87?= <vvidic@valentin-vidic.from.hr>
Cc:     linux-watchdog@vger.kernel.org
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <2a14874f-1e28-6e42-ab87-b2c1e1ca5ac4@roeck-us.net>
 <20190724100026.yk2j36idwjcwvkuc@valentin-vidic.from.hr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <8c5627c7-a046-6f1e-0bc0-c4b38e5e2e35@roeck-us.net>
Date:   Wed, 24 Jul 2019 03:18:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724100026.yk2j36idwjcwvkuc@valentin-vidic.from.hr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/24/19 3:00 AM, Valentin Vidić wrote:
> On Wed, Jul 24, 2019 at 02:43:58AM -0700, Guenter Roeck wrote:
>> Here is a possible explanation for your problem.
>>
>> https://lore.kernel.org/patchwork/patch/770990/
>>
>> It seems like the memory resource is indeed reserved by the intel_pmc_ipc
>> driver.
> 
> Thanks, I will check if I have that one loaded. Here is the
> discussion on linux-i2c, they say it might be a BIOS problem:
> 
>    https://www.spinics.net/lists/linux-i2c/msg41504.html
> 
Yes, Jean's explanation does make a lot of sense.

Guenter
