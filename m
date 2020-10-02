Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8F628156A
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 16:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgJBOlu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 10:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBOlt (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 10:41:49 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC95BC0613D0;
        Fri,  2 Oct 2020 07:41:49 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id c13so1428072oiy.6;
        Fri, 02 Oct 2020 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q5Xu/2yv7/iX4ymnGamD8ek76ylOSfuzCR4QLR4+cNc=;
        b=iXGOY00SBqrdoxhii7JTr31z4g+wZ8rimyNN4lC6KwI4kbcAw6EgqUuRcDMYYIZ78t
         NdyPjfKAElv+pEtwItdP/SWFpJ454Do9tggUNCDoqOCaM7eQWv4RseobylCfRkkCCj89
         NFjlPCBrnQ6F8ZYIGsRB/xQjyLDgK6xVEofbPEKZO62dPG2dutZ0xxfvv736hlPFKP0C
         dufJsKwzfDgaXvEjKEzaeZWLIaqHpWuUFSRJaZ/kp6vJ0qRIzbReenPBNwgdruMLOJsz
         KdYc+n3+QBnZvdeSCC4e1qhjZx5OsG3IGS/ebaIRv+NO3yU7JQSfqjU2Ix40oXDWG/+l
         TbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Q5Xu/2yv7/iX4ymnGamD8ek76ylOSfuzCR4QLR4+cNc=;
        b=I+z7WmH3WkT4JKRS6Rg4m5U4HljE0zDR+AswcAMFV0mIx4xOFZpsVjlAgt3Tn0CoBo
         5sZmmUMBieB/Muw9nS04JriWSEQBzt87I+3hCsAQoqlhrefI0B7Hxxbgwsayprbew3bs
         8/4Yc5kRyWTLTVIXza6Tw7n4hqwdFcd2kZEvJvfGwkwTarZOv+dp64608II4o3m0bmtK
         DwgBCN9EbOD3JT8DTgGkHLKivuBJHzs27hLF8GP9ZXOX6LwjY3MXxs1qt7xMMGYKqlsn
         m1+4KC6ZYfWVzqGPWyxvdJbISrEzRAx5c21jJ7J7JZgGMT2CGwkoFsvmqZeiH5JcTZms
         azew==
X-Gm-Message-State: AOAM530eWtNNoFmWT/x0ienQFvrN1pjzxaEgJe4ptyaIq3oiO+vVv4Z6
        2oZJRSK8BKTuPlS6PTOWL+s=
X-Google-Smtp-Source: ABdhPJwCqCSODdpOcbch5aXOEoArpeYzpH5h/aJGBb52sge1z/HVoqxCtj+1n5LHuWTxM6bhKgO2Rg==
X-Received: by 2002:aca:7215:: with SMTP id p21mr1414435oic.61.1601649709106;
        Fri, 02 Oct 2020 07:41:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm385452otk.24.2020.10.02.07.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 07:41:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
To:     Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
 <20201001151639.GC64648@roeck-us.net>
 <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9d493ec4-6b3e-12a1-01f3-34c09a826290@roeck-us.net>
Date:   Fri, 2 Oct 2020 07:41:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/2/20 2:51 AM, Matthias Brugger wrote:
> 
> 
> On 01/10/2020 17:16, Guenter Roeck wrote:
>> On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
>>> Hi Crystal,
>>>
>>> It seems you forgot to send the email to one of the maintainers, Wim.
>>> Please make sure you add all the maintainers from get_maintainers.pl when
>>> you send a series.
>>>
>>> Regards,
>>> Matthias
>>>
>>> On 29/09/2020 05:20, Crystal Guo wrote:
>>>> v5 changes:
>>>> fix typos on:
>>>> https://patchwork.kernel.org/patch/11697493/
>>>>
>>>> v4 changes:
>>>> revise commit messages.
>>>>
>>>> v3 changes:
>>>> https://patchwork.kernel.org/patch/11692731/
>>>> https://patchwork.kernel.org/patch/11692767/
>>>> https://patchwork.kernel.org/patch/11692729/
>>>> https://patchwork.kernel.org/patch/11692771/
>>>> https://patchwork.kernel.org/patch/11692733/
>>
>> This is less than helpful. It doesn't tell me anything. It expects me to
>> go back to the earlier versions, download them, and run a diff, to figure
>> out what changed. That means the patch or patch series ends at the bottom
>> of my pile of patches to review. Which, as it happens, is quite deep.
>>
>> I will review this and similar patches without change log after (and only
>> after) I have reviewed all other patches in my queue.
>>
> 
> I understand your comments on hard to understand change log. But I think you acted to quick to put this series to the end of your queue. I'll try to explain:
> 
> In v4 you gave your Acked-by and Reviewed-by for the patches that in this series are 3/4 [1] and 4/4 [2] respectively. You also gave your Reviewed-by for 1/4 [3].
> 
> In v4 you stated that you wanted to wait for a review from Rob for the binding changes. Obviously it's up to you to handle that the way you want. From my point of view these are rather trivial changes.
> 

That may be correct, but I am not a DT expert, and it happened often enough
that I approved a DT change and Rob later raised concerns that I don't do it
anymore.

> In 1/4 are deleting compatible fallbacks in the bindings, as the driver provides SoC specific platform data, which you reviewed.
> 
> One can argue that this will break older devicetree bindings because the driver using the fallback would work except for the topgru reset controller. But I think this is the job of the maintainer of the driver as Rob won't be able to look into all the driver code to decide if any change to the bindings is backward compatible. With your Reviewed-by I understand that you are OK with this change. As SoC maintainer I'm fine with the change. MT2701 is a SoC that's not available to the general public. MT8183 is available, but only on chromebooks and I don't expect anybody to use an older kernel without watchdog driver support for mt8183 (enablement is still ongoing). Actually I took the DTS counter part already through my tree, which was an error, as we now have a DTS which does not hold to the binding description (until and if you accept 1/4).
> 
> The only patch missing patch is now 2/4, where Crystal added your Reviewed-by which you never gave. But it just adds the compatible to the binding for a driver you already gave your Reviewed-by. So I think this the series actually just fall through the cracks.
> 
> Sorry for the long mail, but if you got until here, I hope I was able to convince you to just merge the series :)
> 

If my Reviewed-by is indeed in all patches, as you state, even if I didn't give it
to some of those and the submitter just added it (is that acceptable nowadays ?),
there should be no problem and Wim should pick up the series. And if the submitter
had bothered to write a proper change log instead of expecting me to do the work
I would have noticed right away.

No, this was very appropriately put to the end of my review queue.

Guenter
