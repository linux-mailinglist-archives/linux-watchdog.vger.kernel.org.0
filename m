Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C6B3D5AD3
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Jul 2021 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhGZNTF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Jul 2021 09:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233788AbhGZNTF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Jul 2021 09:19:05 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4541BC061757;
        Mon, 26 Jul 2021 06:59:33 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id x3so8836736qkl.6;
        Mon, 26 Jul 2021 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y03+5KriITG8EF/FpR++zoxuxNs19fStOVw7o+xDj98=;
        b=r4FYSK70PpQ9AA58ADc8VqnX4vatSUyyWj9QL3R5Zs9sAQ6tr4AIItUuxnslduVgYp
         HkF9CN7UOsCAByWzEx3NyxlLBMM7e2yJwi9eWv8/8/+COEZMjBaaFUMqYKYiCZM9nl3B
         27vX9x6fWMY6mt7aF8W+uPpQOYIYSKc44BPSltZilFnYR7aerBiK8tSezXM/fV9A2aVx
         pToTSucQwjej16DdEUh48XiTf2gBqPF6OHs9Zk6h0qqezVZ/IvVyHb6JoykNHxYBWr8F
         C8LRQB0zTCRSLIyI7oz2HmdJvaO7g4ZlbUZCqrl7Ulm+Cq3qRSYAuClhSeANIKyPbAvO
         wx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y03+5KriITG8EF/FpR++zoxuxNs19fStOVw7o+xDj98=;
        b=VUV7fFYZLa5fzXeDKmbH7zVSoZ8knEjmh4cMb0r0Jl9n5JSY/M2oN0NzueSto+oqmv
         Ly+eJ4FMeovA7y/LzSyggR1hKGetGvLqx4OR9QZI2Ci0YJhRDaR+Qrwb/KG1M8L11SAh
         88O9jElCt9u4984s0ycsRuN9Q/s/3qz9jmuCWzrzgUJwSGcNgpDb6xF5aOscgvRIY9UI
         g/zBwEMSyMly/xQOgmQzXciDmbh9GpJFmMzMCt+sRMTnlJti40YbNZF/mYcOd90jwz+u
         qj5C/9T6zenLIg0PcP8wY0zTZ0aLwr3Z94VbpVr+w2bvGcsINQDIF06+mECvjFvWjJf3
         X3tA==
X-Gm-Message-State: AOAM533bDh2RVsQHqdU1rmbxfm3uUu41wJ75dVwUUCASrVT6lmePHIIX
        sF39NvPqtLDkz6WBZKM7EnY=
X-Google-Smtp-Source: ABdhPJwM3Qxj2V9r0Kfx+X0lc/RhS8xUPCINSJumrAGXSes6J+8s8J6dPLekXpGfSfE4d+N2M7ub4A==
X-Received: by 2002:a05:620a:1998:: with SMTP id bm24mr17904102qkb.471.1627307972485;
        Mon, 26 Jul 2021 06:59:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s3sm20545qke.85.2021.07.26.06.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 06:59:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <CAHp75VfCydLguFX=MSoAQ_gayra5ovuwLxcY7m_pHiafvB7b5w@mail.gmail.com>
 <c1c15112-b102-570b-1432-568ca219ccf9@siemens.com>
 <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <521d14ad-8952-7ef9-3575-b48cefeb8241@roeck-us.net>
Date:   Mon, 26 Jul 2021 06:59:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdYUUqVi6rd6C-W+1aTXCPs7ehSLDcRfo4RVe7XU+6c+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/26/21 6:40 AM, Andy Shevchenko wrote:
> On Mon, Jul 26, 2021 at 3:04 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 26.07.21 14:01, Andy Shevchenko wrote:
>>> On Mon, Jul 26, 2021 at 2:46 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>>>
>>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>>
>>>> Obviously, the test needs to run against the register content, not its
>>>> address.
>>>>
>>>> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
>>>> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
>>>
>>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Missed SoB of the submitter (hint: configure your Git to make sure
>>> that submitter and author are the same in terms of name-email).
>>
>> The signed off is there. Not sure what you are referring to.
> 
> Nope. It's not. The sign of that is the From: line in the body of the
> email. It happens when the submitter != author. And SoB of the former
> one is absent. But what is strange is that reading them here I haven't
> found the difference. Maybe one is in UTF-8 while the other is not and
> a unicode character degraded to Latin-1 or so?
> 

I have no idea why there is an additional From:, but both From:
tags in the e-mail source are exact matches, and both match the
name and e-mail address in Signed-off-by:. I agree with Jan,
the SoB is there.

Guenter
