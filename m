Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9F6FA8228
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Sep 2019 14:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbfIDMMs (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 4 Sep 2019 08:12:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39113 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbfIDMMs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 4 Sep 2019 08:12:48 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so11150392pgi.6;
        Wed, 04 Sep 2019 05:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PAQW62HDl0bciuqP6fN46/O4uLjRbfz/e823ZKZ4uxo=;
        b=odUTXruYXwCFbaRqN+OB94gJRjA+2S5viypwCnnSxG6Y7hlUQLPxTDkDVYmX7W1rQU
         uv215DqdfEM/8LweNRJ92mZ100vbSk36pwTRS8PoRbF3G4jNQnZFsZE8baMWWdEjJ/4W
         VsnqF+3i4d+9nwck3wj1jdlm3MJTS0yC457YY0BtgCUwX/nHhEe82AoD2DbQbST0u5vC
         tj688e5dfHqXvKvzUK74FIOASegsebMhqjECshw583+PaHJ0HGQnHRNZK6ZgVjxP5Mme
         deZC0fJH1XpZsJb9sNsLJPy+2hgf38hsbLZZsKlhoUg3MtN7KrZ6iqKYKAu4Vxv2TWlH
         DZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PAQW62HDl0bciuqP6fN46/O4uLjRbfz/e823ZKZ4uxo=;
        b=XazBVam9MKDfScbmxxiSZxUO7g3zNTIEFyIDb3LWrH3svlBtlytxkTayNSP2a8J5a8
         c1tA6aBOPaNvKwYPzvUjBZj9R82HhMKtsqSIVncpN0448I3mrYsqX24wxv+T7fP3cpc/
         VuuOu2T8H3IZ7ZhXEdGNcDM9Y9ewzhjb+o5BkMkC5ADKv3yIUubBuRN1lN2i2xtLfxcQ
         wSDHN5LX8Xz2z4HdE62Ha7guvDqtSSbYfwj1zmT9mMvgFUTyMVb7onH3xFHOlUAGivRF
         U0ioiNgFCvQjF+KIJPNJs4B0+dvwlSosUym8eFWLJx2u747nJNp46fpgV6nyroCubXWi
         rGJA==
X-Gm-Message-State: APjAAAXLP55EolJoJ/BAif1uSyVWobpwUKPk6OvcngvcWUF0VP152zrx
        HP+xqDL3m9o6tp9M1v4DZYHfoC0I
X-Google-Smtp-Source: APXvYqyhp7R0xzFwIzqeYLUau3rwyuE7rnJ98aLpivaxyyvptzZSQetH6q0c/XswiqVM7e++yuxtxA==
X-Received: by 2002:a62:7a12:: with SMTP id v18mr2313087pfc.205.1567599166796;
        Wed, 04 Sep 2019 05:12:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x5sm12419072pfi.165.2019.09.04.05.12.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:12:45 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] RFC: watchdog: export core symbols in
 WATCHDOG_CORE namespace
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Matthias Maennich <maennich@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        maco@android.com, sspatil@google.com,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules@vger.kernel.org,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage@lists.one-eyed-alien.net,
        linux-watchdog@vger.kernel.org
References: <20180716122125.175792-1-maco@android.com>
 <20190903150638.242049-1-maennich@google.com>
 <20190903150638.242049-13-maennich@google.com>
 <20190903161045.GA22754@roeck-us.net>
 <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <c6ac941c-06a4-e5dc-5cb9-fca7b40d7e9a@roeck-us.net>
Date:   Wed, 4 Sep 2019 05:12:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARYqqCSCc0G4FL7_bj80iMoLLJrUJ7B3+huD25EUkrttA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/4/19 1:45 AM, Masahiro Yamada wrote:
> On Wed, Sep 4, 2019 at 1:10 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Tue, Sep 03, 2019 at 04:06:38PM +0100, Matthias Maennich wrote:
>>> Modules using symbols from the WATCHDOG_CORE namespace are required to
>>> explicitly import the namespace. This patch was generated with the
>>> following steps and serves as a reference to use the symbol namespace
>>> feature:
>>>
>>>   1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
>>>      in watchdog_core.c
>>>   2) make  (see warnings during modpost about missing imports)
>>>   3) make nsdeps
>>>
>>> I used 'allmodconfig' for the above steps to ensure all occurrences are
>>> patched.
>>>
>>> Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
>>> case as not only watchdog_core is defined in drivers/watchdog/Makefile.
>>> Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
>>> to export into a different namespace.
>>>
>>> An alternative to this patch would be a single definition line before
>>> any use of EXPORT_SYMBOL*:
>>>   #define DEFAULT_SYMBOL_NAMESPACE WATCHDOG_CORE
>>>
>>> This patch serves as a reference on how to use the symbol namespaces.
>>>
>>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Signed-off-by: Matthias Maennich <maennich@google.com>
>>
>> As mentioned before, I am opposed to this set of changes. I don't see
>> the point of restricting the use of exported symbols in WATCHDOG_CORE.
>>
>> Guenter
> 
> 
> I agree.
> 
> I do not like this patch set either.
> 

Note that I don't object to the patch set in general. There may be symbols
which only need be exported in the context of a single subsystem or even
driver (if a driver consists of more than one module). For example, a mfd
driver may export symbols which should only be called by its client drivers.
In such a situation, it may well be beneficial to limit the use of exported
symbols.

I am not sure what good that does in practice (if I understand correctly,
a driver only has to declare that it wants to use a restricted use symbol
if it wants to use it), but that is a different question.

Guenter
