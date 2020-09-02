Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5BA25AE34
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Sep 2020 17:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbgIBPAg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Sep 2020 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgIBNr0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Sep 2020 09:47:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1169FC061247;
        Wed,  2 Sep 2020 06:36:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id w186so2545901pgb.8;
        Wed, 02 Sep 2020 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RebqManfmRh4k1my0fORF4PpG+ZBOiH+ffG4v0sIRf8=;
        b=R88tGuDvxyhnCYg/yozfOUBVR7EWDhJPDNlwLc3DzZkwA5eGOSQfuybBa6Kd+wldLh
         ZlrWg0oVr8Deb5oJZLs4YPHm6UdKlQxnwSLFBSCYYv7w3CQMkM/VQG/YsnldnwANAyEj
         eo6MXkXe+cVUn+wr4Mvb6/SQcxYVNtCj49Hshs/b/ocN9eK1u9+KKJjlNECyYPkbNjrx
         uVmdqvbKaF3ItU1vATzte+5oigkfd46IL2AwMmJu5VbheeZyhHwSxbLSICruBMv7FcZF
         B5UgZAn9T0zC4cBvhysqaqXOv1J5TDZooiY0jbLQHMwJJbpQSsu8QT5nKtTOXDQ/CBQM
         PFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RebqManfmRh4k1my0fORF4PpG+ZBOiH+ffG4v0sIRf8=;
        b=NqLaTKnSzt9MOw8LxDgitqpSoalhykaEtIpOrx5KvLyhsNJ6idR8s2o56DRTv1DTIE
         6kQGMELywHz8jVOiBOov+TqXSWu50rz2pKLuwPwPGyWFTaETgYkeD3frAfZFMJZIh4xt
         BAUjkic4SNzP5pkYSFQpNoLs0TuREBQejEXlgQS6DxS9Dcx96I3KZEZfJFziWzeaAAwj
         9eYXZR2B0ryZCU5w17DNw680EOoQLEmZsf4PefJZ5KInUy+88R7Vpt5cXIDpKotkv8mT
         KlREwTfFC0afh3JhYnXrpHnR8uEzLyOpJkD20SljEJDM6xf/WrFhKLz1QwG0ACkle43H
         LZcQ==
X-Gm-Message-State: AOAM532Knz0gd1gW3BnIlkzy/PM27G0ghjqGwACl4fWqSl+fnUbnp3BT
        bnvd3ZSoAyesS7JEOX3W98aLmNpPIQQ=
X-Google-Smtp-Source: ABdhPJxvoLHy4xwnsQB4ReeZa22a4Bjitew5g3qrRf1bg85kMJYMqLhtCeAJ8MLXjMHZd4ofjTO6hA==
X-Received: by 2002:a65:4984:: with SMTP id r4mr1882201pgs.261.1599053790744;
        Wed, 02 Sep 2020 06:36:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y9sm1521888pfr.38.2020.09.02.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 06:36:30 -0700 (PDT)
Subject: Re: watchdog start on restart
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1721f170-95df-2451-e3af-6369e830afad@roeck-us.net>
Date:   Wed, 2 Sep 2020 06:36:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/2/20 6:02 AM, Ivan Mikhaylov wrote:
> Hello everyone. Currently, the watchdog interface only has "stop watchdog on
> restart" but lacks a "start watchdog on restart" one. Is there a way to achieve
> such functionality?
> 
> I'd like to know why "stop watchdog on restart" wasn't implemented via ioctl
> interface? It would be more convenient from user perspective and you can
> control that behavior whenever you want from application layer.
> 

Because it is and always was a driver level decision. The function was added
to replace lots of driver level code implementing this functionality.
Overriding it from userspace doesn't make sense because the driver is supposed
to have a reason for disabling it on reboot (for example due to clock issues
or power issues or becasue it has a short hardware timeout).

> I have some thoughts on this problem that solve the aforementioned
> issue with "start watchdog on restart" but I don't think that my solution is
> correct.
> 
That functionality doesn't make much sense. It can be accomplished by not
stopping the watchdog on reboot in the first place. And if the watchdog
wasn't running before, it can be started from userspace just before the
reboot.

Guenter
