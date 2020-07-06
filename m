Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C54B2216166
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Jul 2020 00:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgGFWSi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jul 2020 18:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgGFWSh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jul 2020 18:18:37 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A481C061755;
        Mon,  6 Jul 2020 15:18:37 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ch3so2423012pjb.5;
        Mon, 06 Jul 2020 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mj6LNbVzEANcDaUcsWYm+6YG9z1rqSQm+YiQdijgNI8=;
        b=sHipr7V0ULdCvgge4ccZZ7FsuO2p17fvaIVwFoI0+3yFkL4o2G/Ygz1NSbGKazwjKJ
         23UvQkCJToAAH48nWs2btPJEATLGsMldmFv/paj4mZPnCkE/1ZE2cr0lOqZWgrj+NxLs
         bVFZQG5/uQKTJZyvlbPbpggYSIgls4QE9gs/lUCkiDu3iQXcjcGKVg4/6sXAAMtCRo52
         nzsOi9YyutaIwWUJNODa00TMm6VI/YMdtHNbci2t5IGeiyGSg0pR4Q3/8KX/x+H6VrKS
         itRhsw2PRdCfKuMkMw+qSP7l2ZSqVZLYstaVSt4Hfs5NhA+/5Z4zNVJy56s1JCgwM1tn
         XH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Mj6LNbVzEANcDaUcsWYm+6YG9z1rqSQm+YiQdijgNI8=;
        b=p14IjQo6PANjdaTdRI0/gMJUkujuHp8HCh7/6D0cfWf72pj6mrpeFfABFF4Hn4Zunw
         n0ekX4cUMP1b6C3zHglyqQNPxXNVjVcB4/ZWKPHS03HaZux0cOPtKTJfvDrQTEpL9Joi
         48lQxcvF1F7kouPDCrWL6iignR2ogbdqRUPkskdKMcX0ombGWMjw2bn+2gxZ0ymZyG3E
         LhZLbx90bZ1fZBHOmSxHXPlK/h/uhXQE52hjTxfhiUrDpUfXcWbW7NwcMf1B66sgxu/r
         sU+esm95OQGQhscgv7N4PuEfE711mJss+TFrTONWQPtIeA7eBqtDEnrpYTDvVB1BpIed
         ltCg==
X-Gm-Message-State: AOAM530ohXOwNl1n+21K0/F+aoUEpp6zmn+r/xno37vNQihH2U1+6Ihy
        LsuCwaYrSRyMQiNYpkyRXPoCW+ySMg8=
X-Google-Smtp-Source: ABdhPJxNWBvglOyFTNPSQfNqvtmX1xcMkZyh/l/y5jnQW9Z7hPXelCSq0svZx7PqgmVE7u6wsTLDPQ==
X-Received: by 2002:a17:902:b905:: with SMTP id bf5mr12960001plb.250.1594073917224;
        Mon, 06 Jul 2020 15:18:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q10sm21551710pfk.86.2020.07.06.15.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 15:18:36 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] watchdog: Add common nowayout parameter to
 booke_wdt driver
To:     Timothy Myers <timothy.myers@adtran.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        David Boike <david.boike@adtran.com>
References: <CH2PR19MB359059AA5C8917D8D24633FF9D690@CH2PR19MB3590.namprd19.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <ed8ba33f-b3d4-8070-e0ca-fdaf4668cf91@roeck-us.net>
Date:   Mon, 6 Jul 2020 15:18:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CH2PR19MB359059AA5C8917D8D24633FF9D690@CH2PR19MB3590.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/6/20 9:33 AM, Timothy Myers wrote:
> Add the common "nowayout" parameter to booke_wdt to make this behavior
> selectable at runtime and to make the implementation more consistent with
> many other watchdog drivers.
> 
> Signed-off-by: Timothy Myers <timothy.myers@adtran.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> Changes in:
> 	v2:
> 		Added Guenter Roeck's reviewed-by tag at his request
> 	v3:
> 		Fix whitespace formatting in message.
> ---

Change log goes here.

I applied your patch to watchdog-next, but there is still something
in it which prevents it from showing up at
https://patchwork.kernel.org/project/linux-watchdog/list/, even though
I do see it at https://lore.kernel.org/linux-watchdog/.

Looking into the e-mail source, I think the problem may be due
to some Outlook specific formatting in the raw message:

Add the common "nowayout" parameter to booke_wdt to make this behavior=0A=
selectable at runtime and to make the implementation more consistent with=
=0A=
many other watchdog drivers.=0A=
=0A=

and so on. If that is persistent, it may make sense to fix it, or
you might wonder why some of your patches are being ignored.

Thanks,
Guenter
