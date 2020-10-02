Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A26281020
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 11:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgJBJvd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 05:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgJBJvd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 05:51:33 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C4F5C0613D0;
        Fri,  2 Oct 2020 02:51:33 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so1067726wmi.0;
        Fri, 02 Oct 2020 02:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JsKpxIiLUITlisbV8j9skikAqGMR95uSktowmIHgutA=;
        b=A0qTRfWz7cq1fco4qQLSV+miarttvfkt3vP+GSiw70hT9BCOt+wSdPs899qcCx2xKN
         cDuAUC8HQLYYH2w3wdCpmhbizZ15YFzyl294yfbq47OA3qXwB6ol/UCrlwsQXEddBDgm
         RADxIyK/CoWlcf5XfFKgLfmKqkFiSVA2BIq1+7j4uQpJQQFXFx2VF87JB7VlwnOwdI12
         MypAY7IfvebVTJhqfTvCVCGPBK7E/nKNNR4oEdS+uSHZmu9CcsopgdCYgmdI1HrZnFIH
         P+f5oD0xwWv9GXoqlTV7uVp3abzcQig12WqxZG1G/cPQH97YOOgD1ZxzxFC5JUsRsRM+
         8pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JsKpxIiLUITlisbV8j9skikAqGMR95uSktowmIHgutA=;
        b=Bxx2QCldpOy3hU9PcnOEqXafkvxFoDtQnKBEoq4asFuJ+M6M+2jvA8TNNCBIV4QRgz
         lrAG9tRWBp1Ap66cCOND1qZLKT6hUPo+3c7yn4kDxk9gcgIllZRkYWXsBZWtRyc2I7Ng
         oLrmUFM77LMF2EPUj7+tr4n2tZ6LtSFoE+nADq9DlZyLtWeliLtQAxz/qoDfEYdLTutP
         PzrAogAuVwtUTuccJ80amhpokGuzIpEGztJX2wKqS9SXHb++0d9KJJxPxuht3E0pyiDW
         qojdOPpBJB0PDKnlA+5nvMahGWk5MSgKkgsuXEh+UwPItILd6AB+0hwmmpLviLWsqVz7
         t3EQ==
X-Gm-Message-State: AOAM532wCFvtMYVKZXInpHbAqgplTRByo+uLAlHy4R+Gapyr9ZcIMXgr
        qQpUFJaSWtjD3sXOjKu5D0g=
X-Google-Smtp-Source: ABdhPJwNDnpt/0BeWbOMzXzen90CR12CPrbzs6M71xmRuxcdAaZr3YP6i5A4dN7kg7kt5841P7JjYQ==
X-Received: by 2002:a7b:cc17:: with SMTP id f23mr1821738wmh.166.1601632291761;
        Fri, 02 Oct 2020 02:51:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
        by smtp.gmail.com with ESMTPSA id c4sm1129964wrp.85.2020.10.02.02.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 02:51:31 -0700 (PDT)
Subject: Re: [v5,0/4] watchdog: mt8192: add wdt support
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Crystal Guo <crystal.guo@mediatek.com>, robh+dt@kernel.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com,
        Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20200929032005.15169-1-crystal.guo@mediatek.com>
 <71e21cfd-fd44-2cf9-cf8a-f83dc1b0cc89@gmail.com>
 <20201001151639.GC64648@roeck-us.net>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <89835d94-7f26-bdc3-4760-af00978aba44@gmail.com>
Date:   Fri, 2 Oct 2020 11:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201001151639.GC64648@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 01/10/2020 17:16, Guenter Roeck wrote:
> On Thu, Oct 01, 2020 at 04:23:02PM +0200, Matthias Brugger wrote:
>> Hi Crystal,
>>
>> It seems you forgot to send the email to one of the maintainers, Wim.
>> Please make sure you add all the maintainers from get_maintainers.pl when
>> you send a series.
>>
>> Regards,
>> Matthias
>>
>> On 29/09/2020 05:20, Crystal Guo wrote:
>>> v5 changes:
>>> fix typos on:
>>> https://patchwork.kernel.org/patch/11697493/
>>>
>>> v4 changes:
>>> revise commit messages.
>>>
>>> v3 changes:
>>> https://patchwork.kernel.org/patch/11692731/
>>> https://patchwork.kernel.org/patch/11692767/
>>> https://patchwork.kernel.org/patch/11692729/
>>> https://patchwork.kernel.org/patch/11692771/
>>> https://patchwork.kernel.org/patch/11692733/
> 
> This is less than helpful. It doesn't tell me anything. It expects me to
> go back to the earlier versions, download them, and run a diff, to figure
> out what changed. That means the patch or patch series ends at the bottom
> of my pile of patches to review. Which, as it happens, is quite deep.
> 
> I will review this and similar patches without change log after (and only
> after) I have reviewed all other patches in my queue.
> 

I understand your comments on hard to understand change log. But I think you 
acted to quick to put this series to the end of your queue. I'll try to explain:

In v4 you gave your Acked-by and Reviewed-by for the patches that in this series 
are 3/4 [1] and 4/4 [2] respectively. You also gave your Reviewed-by for 1/4 [3].

In v4 you stated that you wanted to wait for a review from Rob for the binding 
changes. Obviously it's up to you to handle that the way you want. From my point 
of view these are rather trivial changes.

In 1/4 are deleting compatible fallbacks in the bindings, as the driver provides 
SoC specific platform data, which you reviewed.

One can argue that this will break older devicetree bindings because the driver 
using the fallback would work except for the topgru reset controller. But I 
think this is the job of the maintainer of the driver as Rob won't be able to 
look into all the driver code to decide if any change to the bindings is 
backward compatible. With your Reviewed-by I understand that you are OK with 
this change. As SoC maintainer I'm fine with the change. MT2701 is a SoC that's 
not available to the general public. MT8183 is available, but only on 
chromebooks and I don't expect anybody to use an older kernel without watchdog 
driver support for mt8183 (enablement is still ongoing). Actually I took the DTS 
counter part already through my tree, which was an error, as we now have a DTS 
which does not hold to the binding description (until and if you accept 1/4).

The only patch missing patch is now 2/4, where Crystal added your Reviewed-by 
which you never gave. But it just adds the compatible to the binding for a 
driver you already gave your Reviewed-by. So I think this the series actually 
just fall through the cracks.

Sorry for the long mail, but if you got until here, I hope I was able to 
convince you to just merge the series :)

Best regards,
Matthias

[1] https://patchwork.kernel.org/patch/11697493/
[2] https://patchwork.kernel.org/patch/11697483/
[3] https://patchwork.kernel.org/patch/11697477/

> Guenter
> 
>>>
>>> Crystal Guo (4):
>>>     dt-binding: mediatek: watchdog: fix the description of compatible
>>>     dt-binding: mediatek: mt8192: update mtk-wdt document
>>>     dt-binding: mt8192: add toprgu reset-controller head file
>>>     watchdog: mt8192: add wdt support
>>>
>>>    .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
>>>    drivers/watchdog/mtk_wdt.c                         |  6 +++++
>>>    .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
>>>    3 files changed, 39 insertions(+), 2 deletions(-)
>>>    create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
>>>
