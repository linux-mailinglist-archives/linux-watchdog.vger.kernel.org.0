Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD999264A96
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Sep 2020 19:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgIJREq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Sep 2020 13:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgIJQzd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Sep 2020 12:55:33 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEE65C061389;
        Thu, 10 Sep 2020 09:53:21 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id t76so6555107oif.7;
        Thu, 10 Sep 2020 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OF9x9aCRYQId9DTEeUUlbYKv+AnvnaiO1HEaClAF3pU=;
        b=G0oo/YKN3aMocisM9YvUVUXZ6P0HjlzEh1aN0JBLSr1UF685NZz4FvV9yy9ciETOdg
         MkSjfl7r3DqSkVXT67uAu6Cs2Ab2eoYVWMIWpwvCFIAkW6cxwts4h7e338HO1cNgygv/
         UNG5BeaCdOu6SLhPNATJBf1TX3engBh5U0LPzR0T43v9Dv5WU3udl29CuTakPLk9fVSg
         XMr5C0iW6krWRxoIOi9+eNgeFsuyZFfZj8VSp+lrT88zXcFS85Z/7aeVmjK0iD2DrBWX
         1J1UF1RLPaSpGBD1CGMMCODa+LIKZirT7cdKdRVaQnAwKBpDYi76Eb8ZesKvUiROGD4i
         rQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=OF9x9aCRYQId9DTEeUUlbYKv+AnvnaiO1HEaClAF3pU=;
        b=Xb8Y+dLmLVl/zabUA59PyyOneY37HHoEiwTTG+SYvwLhcuR1skaq0fwN5bOpMVW6fv
         XXNKAZtJKX5IRSWwEYzSUGU3cxfeNYJyXW4PuOVWS1EpUlpasNyoyLuYTBUkxyRKagKY
         RaEVgITQP21ze+WdEfmn5vwhakcahw6ToK09XoVEexjtpNRC/gcu0Yl0+obdYshs/q5C
         uv/CINimL14DFFLd+UlmJctnnbOnMfkPz+R1unnmvtJJFlsSFpwVRI5kXHOxXzBxCcs7
         R6C0dMJPQo0u9u6V2Tsz5oGQx8HgqPzIc1oLoHATX1Ya6XINKwynqn4oHSN3iRISkpRR
         8mfA==
X-Gm-Message-State: AOAM532zuGFyBxOHh2meR5FE8v0SigBnar6JQwDgOqZW/XgS0AeYX7yE
        1xERQfzUEdveF3sPPMig6GCl5tbTw8w=
X-Google-Smtp-Source: ABdhPJxxQYeAOeg3pQKmRgUNcP8siZqU1f68A6vskafhEbE4hH+ZCtk/VqtxCUvbHWW164Fa89jkYw==
X-Received: by 2002:a54:4e84:: with SMTP id c4mr586085oiy.22.1599756799753;
        Thu, 10 Sep 2020 09:53:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1sm1004074oof.8.2020.09.10.09.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 09:53:18 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: sp5100_tco: Enable watchdog on Family 17h
 devices if disabled
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200910163109.235136-1-linux@roeck-us.net>
 <20200910163109.235136-2-linux@roeck-us.net>
 <30f69c2c-d4c8-a143-6bfa-34394b6361cf@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6ff3df92-3465-f619-7c21-eed421ff719d@roeck-us.net>
Date:   Thu, 10 Sep 2020 09:53:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <30f69c2c-d4c8-a143-6bfa-34394b6361cf@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Jan,

On 9/10/20 9:34 AM, Jan Kiszka wrote:
> On 10.09.20 18:31, Guenter Roeck wrote:
>> On Family 17h (Ryzen) devices, the WatchdogTmrEn bit of PmDecodeEn not only
>> enables watchdog memory decoding at 0xfeb00000, it also enables the
>> watchdog hardware itself. Use this information to enable the watchdog if
>> it is not already enabled.
>>
>> Cc: Jan Kiszka <jan.kiszka@siemens.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>  drivers/watchdog/sp5100_tco.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>> index 85e9664318c9..a730ecbf78cd 100644
>> --- a/drivers/watchdog/sp5100_tco.c
>> +++ b/drivers/watchdog/sp5100_tco.c
>> @@ -17,6 +17,12 @@
>>   *	    AMD Publication 51192 "AMD Bolton FCH Register Reference Guide"
>>   *	    AMD Publication 52740 "BIOS and Kernel Developer’s Guide (BKDG)
>>   *				for AMD Family 16h Models 30h-3Fh Processors"
>> + *	    AMD Publication 55570-B1-PUB "Processor Programming Reference (PPR)
>> + *				for AMD Family 17h Model 18h, Revision B1
>> + *				Processors (PUB)
>> + *	    AMD Publication 55772-A1-PUB "Processor Programming Reference (PPR)
>> + *				for AMD Family 17h Model 20h, Revision A1
>> + *				Processors (PUB)
>>   */
>>  
>>  /*
>> @@ -241,6 +247,18 @@ static int sp5100_tco_setupdevice(struct device *dev,
>>  		break;
>>  	case efch:
>>  		dev_name = SB800_DEVNAME;
>> +		/*
>> +		 * On Family 17h devices, the EFCH_PM_DECODEEN_WDT_TMREN bit of
>> +		 * EFCH_PM_DECODEEN not only enables the EFCH_PM_WDT_ADDR memory
>> +		 * region, it also enables the watchdog itself.
>> +		 */
>> +		if (boot_cpu_data.x86 == 0x17) {
>> +			val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>> +			if (!(val & EFCH_PM_DECODEEN_WDT_TMREN)) {
>> +				sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN, 0xff,
>> +							  EFCH_PM_DECODEEN_WDT_TMREN);
>> +			}
>> +		}
>>  		val = sp5100_tco_read_pm_reg8(EFCH_PM_DECODEEN);
>>  		if (val & EFCH_PM_DECODEEN_WDT_TMREN)
>>  			mmio_addr = EFCH_PM_WDT_ADDR;
>>
> 
> Won't that bring us EFCH_PM_WDT_ADDR as address, rather than
> EFCH_PM_ACPI_MMIO_ADDR which worked in my case? Or is one an alias of
> the other.
> 

Yes, it does use EFCH_PM_WDT_ADDR. EFCH_PM_ACPI_MMIO_ADDR works as well,
but is meant to be a fallback. Both point to the watchdog memory space.

Thanks,
Guenter
