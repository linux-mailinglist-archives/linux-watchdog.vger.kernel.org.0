Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AC1366A4C
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 13:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239605AbhDUL7W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 07:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239552AbhDUL7K (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 07:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619006314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NaElvfhG1ut7UsAJQ3t0dihJhEtIJBT86R6S/1O/j40=;
        b=KsoMlUhBpBpchPeNkGiwNjsyQCnoe62ktBOwBTxpLaOa+6qfQcanG7HDmTfeZT4mCnEzSR
        mT5JKFCnVWcfiOiim9//EWyNdQI/C1k2dZaoN2dbJekjM/gTSbm3RUndPqGQJl8l1gtWvz
        EEycHLNfj6V62W52TlvS50GBBB6CRyE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-2Tgfev7yN12YF5bsJv1kLw-1; Wed, 21 Apr 2021 07:58:32 -0400
X-MC-Unique: 2Tgfev7yN12YF5bsJv1kLw-1
Received: by mail-ed1-f72.google.com with SMTP id z3-20020a05640240c3b029037fb0c2bd3bso15015906edb.23
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Apr 2021 04:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NaElvfhG1ut7UsAJQ3t0dihJhEtIJBT86R6S/1O/j40=;
        b=BeUAIiFqGEOqcZEJSjWbX/6JbR0TI1CT8NKs5R8nRu1qWxXqDYhfExbHV7OuuJFg26
         cQKXo0+lIKAn0NtaiQgwoU5PxI3xR8TZJFNQvjbbuYL0SsNfNn1whmyti6zSw5Qo3xki
         01BlSmFAvRF9cGi/t+V0XM+GBDSILVLAAAZHejbcugypvDg9R29Pql+cnBsCQwRYrpGc
         CqY43r2mRhLe0UBtBehYq+5FlIgbFJMCp9Gc/tIjGXzXmAoFFAGjUlJFt/y5/cziCC3o
         KWDgxp09t984ykK4/0pgduWqZ1aNQEx7di5z3qczIAq+Jt2DRlLWrijMZBFqbAlNvSrj
         U4YA==
X-Gm-Message-State: AOAM532i6HVZv8i5lxKE+O0N49G1onravdWfxCaI4Dl37bPcZzvqhP+c
        qoh2eJ4qIWH6yosoHmIqdVJ+zU3jrliHBRHyl0VrsxEWxQLHKh6LeODo8OEkEsEEy2BvZtEqGXx
        MnaP4fle1QqWNaY4+yCZ8wdsjsmEvyIBPq+sZCoGIheLivTZwEVsi+BFZx0PojaNwmLXMxYzewR
        2r0AE=
X-Received: by 2002:a17:907:7b98:: with SMTP id ne24mr29344582ejc.304.1619006311094;
        Wed, 21 Apr 2021 04:58:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykm9U2sPDdnZLZb6hlL89pkjGxYx3pEKARR632PdA1BtTOsGpN7kfPinTw7pl16aa0kkYw3A==
X-Received: by 2002:a17:907:7b98:: with SMTP id ne24mr29344543ejc.304.1619006310788;
        Wed, 21 Apr 2021 04:58:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hg19sm2234762ejc.24.2021.04.21.04.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 04:58:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/8] MAINTAINERS: Add entry for devm helpers
To:     matti.vaittinen@fi.rohmeurope.com,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <eec1797734e3d080662aa732c565ed4a3c261799.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
 <e064fdd7-b276-6732-16fe-2eb2564b2179@redhat.com>
 <YFn5CSB1O3i+SzgR@kroah.com>
 <da0233f3223d7c0816581afe0969caf0abe20378.camel@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <96935c55-c799-595e-024c-56fd352f279e@redhat.com>
Date:   Wed, 21 Apr 2021 13:58:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <da0233f3223d7c0816581afe0969caf0abe20378.camel@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 4/21/21 9:51 AM, Matti Vaittinen wrote:
> 
> On Tue, 2021-03-23 at 15:19 +0100, Greg KH wrote:
>> On Tue, Mar 23, 2021 at 02:58:28PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/23/21 2:56 PM, Matti Vaittinen wrote:
>>>> Devm helper header containing small inline helpers was added.
>>>> Hans promised to maintain it.
>>>>
>>>> Add Hans as maintainer and myself as designated reviewer.
>>>>
>>> Ultimately this is up to Greg though, so lets wait and see what
>>> Greg has to say about this.
>>
>> Can we move some of the devm_* calls in include/device.h into here as
>> well so that you all can be in charge of them instead of me?
> 
> Seems like this was left w/o answer. I guess the question was pointed
> to Hans

I believe that Greg was (mostly) joking here. At least that is how
I interpreted Greg's reply,which is why I did not answer.

Also note that Greg merged this series, but not this patch,
so the new devm-helpers.h file will presumably be maintained by Greg.

Regards,

Hans

