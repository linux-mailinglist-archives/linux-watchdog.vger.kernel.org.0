Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1142A33D109
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Mar 2021 10:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234802AbhCPJnq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Mar 2021 05:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45717 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234782AbhCPJnU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Mar 2021 05:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615887800;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bQIOSEk5BjrSRm1laXXj6IwKnY3/TWDw4P4sj8DiKt4=;
        b=ijpk2Ib48FcANiZOR3zumPV6DyPCi8i+kgrYX6jzAwJZ/ts7g60HCm+V2sggOQ7T5YcQWd
        N4Bc7HnB8CeOKWEbbMwmEvhMLK3DR36l7z+o3QWSc/bg8KQY52J2PMrnlvBQcIRizHgiSi
        wwNRWwQpTlsVBLIrCbCnqR4fc+MtROs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-00V6KJLEMymPjBtTpv-LFA-1; Tue, 16 Mar 2021 05:43:18 -0400
X-MC-Unique: 00V6KJLEMymPjBtTpv-LFA-1
Received: by mail-ej1-f69.google.com with SMTP id kx22so5271329ejc.17
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Mar 2021 02:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bQIOSEk5BjrSRm1laXXj6IwKnY3/TWDw4P4sj8DiKt4=;
        b=Wr8WU8xVJJQgRLM3a3Q+gff9i+lIezMEcwHrUMN3lGEDpI3nAcWVjHDS4yCXFtpdI0
         mNfbE0Z4Wb++xH2hDV9p1xW7i+Fjq0hgKayp1k0YxJUNfAjVYJ2rLAkp1xkbrUfl1qon
         8o/KCKAlCzglDlVw4jhSgKLMpaA6lSLSzo6SYWVmx3tjhhDsseOd1fN1cfS/0lzHCE7G
         2wYakmYBg6oAzUqlOUwrE80SjUNYpbhp+4EAiTdnMnsXyD2LLZ5Nzo0URqyn/Vu87YHR
         WAHqbf02NsBVJK0JktlVGZeAXXwn/myEC6gmFxT8Xnl3WZO6k0a/zrG39Rk9XES8soat
         Tf8A==
X-Gm-Message-State: AOAM530w9Eko8cT/Ba8ANc+hZZbPvZhNCeZ1rbp6DV/uzRCzTEq5tJY+
        Qp03SU5SQa4qPbvW4gmfsQABRWhOlF/xBaaDkuEdoHPpyTMiH+MjxaHkBY6K1gCli3O8bJAAD8a
        QCy+8GMg5LrV49Wo3c4h9GVcTulU=
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr27734345ejc.97.1615887797300;
        Tue, 16 Mar 2021 02:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2VbTg9Bkoq3u6rCT48R/wuXJcfOSgwAd7SVDhw1O0S63eru4u6ACw4WJ2U5nlYsqUO6O+vA==
X-Received: by 2002:a17:906:78d:: with SMTP id l13mr27734327ejc.97.1615887797094;
        Tue, 16 Mar 2021 02:43:17 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e18sm8947663eji.111.2021.03.16.02.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 02:43:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pmc_atom: use callback for all dmi quirk
 entries
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
 <20210315145855.17174-1-henning.schild@siemens.com>
 <8577f3a8-c5e4-3752-1bc1-5937ee164217@redhat.com>
 <20210315180011.6a3f60b0@md1za8fc.ad001.siemens.net>
 <43841119-4839-09d2-b606-7dd40cad4b89@redhat.com>
 <20210316064743.0b5a47cf@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c416d06-4190-2d1b-3969-209c4291d73b@redhat.com>
Date:   Tue, 16 Mar 2021 10:43:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210316064743.0b5a47cf@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Henning,

On 3/16/21 6:47 AM, Henning Schild wrote:
> Hoi Hans,
> 
> on a slighly different but also related topic. Did you ever come across
> SMSC SCH5347? Seems to be pretty similar to 56xx, only with spec non
> public ... and probably less often in use
> Maybe you happen to have code, or know the differences. We already have
> it working with a modified copy of sch56xx but that is still rough and
> i thought i ask before we potentially duplicate work.

The history of FSC (Fujitsu-Siemens Computers) sensor support goes something
like this:

1. The university which I worked at had picked a FSC machine for the
replacement of all workstations, the FSCXXX sensor chip it had was i2c based,
so I could relatively easy reverse-engineer it and wrote a driver.

2. Around the time I stopped working for the university and started working
for Red Hat (2008) FSC contacted me and asked me if I wanted to help them
with officially supporting the FSC and later the SCH devices. They provided
test hardware and documentation at this time.

3. This continued for a while when FSC became just "Fujitsu" and things
moved from the FSC i2c based chips to the super-io based SCH chips. After
a while Fujitsu stopped contacting me about new chips and I stopped working
on this.

So ATM I'm not working no SCH56xx support and I've not worked on that for
quite some time now. So it is good to hear that you will be contributing
SCH5347 support to the kernel.

Regards,

Hans






> Am Mon, 15 Mar 2021 19:01:13 +0100
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi,
>>
>> On 3/15/21 6:00 PM, Henning Schild wrote:
>>> Am Mon, 15 Mar 2021 17:31:49 +0100
>>> schrieb Hans de Goede <hdegoede@redhat.com>:
>>>   
>>>> Hi,
>>>>
>>>> On 3/15/21 3:58 PM, Henning Schild wrote:  
>>>>> Introduce a global variable to remember the matching entry for
>>>>> later printing. Also having a callback allows to stop matching
>>>>> after the first hit.
>>>>>
>>>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>>>>> ---
>>>>>  drivers/platform/x86/pmc_atom.c | 26 ++++++++++++++++++++------
>>>>>  1 file changed, 20 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/pmc_atom.c
>>>>> b/drivers/platform/x86/pmc_atom.c index 38542d547f29..d0f74856cd8b
>>>>> 100644 --- a/drivers/platform/x86/pmc_atom.c
>>>>> +++ b/drivers/platform/x86/pmc_atom.c
>>>>> @@ -364,8 +364,16 @@ static void pmc_dbgfs_register(struct pmc_dev
>>>>> *pmc) #endif /* CONFIG_DEBUG_FS */
>>>>>  
>>>>>  static bool pmc_clk_is_critical = true;
>>>>> +static const struct dmi_system_id *dmi_critical;
>>>>>  
>>>>> -static int siemens_clk_is_critical(const struct dmi_system_id *d)
>>>>> +static int dmi_callback(const struct dmi_system_id *d)
>>>>> +{
>>>>> +	dmi_critical = d;    
>>>>
>>>> Don't introduce a global variable for this please. Instead just
>>>> directly print the ident of the matching dmi_system_id here.  
>>>
>>> Sorry, missed that part. Result looks nice and clean, thanks. I
>>> think i will squash it into 4/4 in v3 and not follow up here for
>>> now.  
>>
>> Ack, that sounds good to me.
>>
>> Regards,
>>
>> Hans
>>
>>
>>>>> +
>>>>> +	return 1;
>>>>> +}
>>>>> +
>>>>> +static int dmi_callback_siemens(const struct dmi_system_id *d)
>>>>>  {
>>>>>  	u32 st_id;
>>>>>  
>>>>> @@ -373,7 +381,7 @@ static int siemens_clk_is_critical(const
>>>>> struct dmi_system_id *d) goto out;
>>>>>  
>>>>>  	if (st_id == SIMATIC_IPC_IPC227E || st_id ==
>>>>> SIMATIC_IPC_IPC277E)
>>>>> -		return 1;
>>>>> +		return dmi_callback(d);
>>>>>  
>>>>>  out:
>>>>>  	pmc_clk_is_critical = false;
>>>>> @@ -388,6 +396,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk0 is used for an external HSIC USB
>>>>> HUB */ .ident = "MPL CEC1x",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
>>>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10
>>>>> Family"), @@ -396,6 +405,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk0 - 3 are used for the 4 ethernet
>>>>> controllers */ .ident = "Lex 3I380D",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex
>>>>> BayTrail"), DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>>>>> @@ -404,6 +414,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk* - are used for ethernet
>>>>> controllers */ .ident = "Lex 2I385SW",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex
>>>>> BayTrail"), DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
>>>>> @@ -412,6 +423,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk* - are used for ethernet
>>>>> controllers */ .ident = "Beckhoff CB3163",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
>>>>> @@ -420,6 +432,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk* - are used for ethernet
>>>>> controllers */ .ident = "Beckhoff CB4063",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
>>>>> @@ -428,6 +441,7 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk* - are used for ethernet
>>>>> controllers */ .ident = "Beckhoff CB6263",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
>>>>> @@ -436,13 +450,14 @@ static const struct dmi_system_id
>>>>> critclk_systems[] = { {
>>>>>  		/* pmc_plt_clk* - are used for ethernet
>>>>> controllers */ .ident = "Beckhoff CB6363",
>>>>> +		.callback = dmi_callback,
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
>>>>>  		},
>>>>>  	},
>>>>>  	{
>>>>> -		.callback = siemens_clk_is_critical,
>>>>> +		.callback = dmi_callback_siemens,
>>>>>  		.ident = "SIEMENS AG",
>>>>>  		.matches = {
>>>>>  			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
>>>>> @@ -457,7 +472,6 @@ static int pmc_setup_clks(struct pci_dev
>>>>> *pdev, void __iomem *pmc_regmap, {
>>>>>  	struct platform_device *clkdev;
>>>>>  	struct pmc_clk_data *clk_data;
>>>>> -	const struct dmi_system_id *d;
>>>>>  
>>>>>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>>>>>  	if (!clk_data)
>>>>> @@ -468,8 +482,8 @@ static int pmc_setup_clks(struct pci_dev
>>>>> *pdev, void __iomem *pmc_regmap, if
>>>>> (dmi_check_system(critclk_systems)) { clk_data->critical =
>>>>> pmc_clk_is_critical; if (clk_data->critical) {
>>>>> -			d = dmi_first_match(critclk_systems);
>>>>> -			pr_info("%s critclks quirk enabled\n",
>>>>> d->ident);
>>>>> +			pr_info("%s critclks quirk enabled\n",
>>>>> +				dmi_critical->ident);
>>>>>  		}
>>>>>  	}
>>>>>  
>>>>>     
>>>>  
>>>   
>>
> 

