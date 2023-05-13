Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D83E70159F
	for <lists+linux-watchdog@lfdr.de>; Sat, 13 May 2023 11:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbjEMJZN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 13 May 2023 05:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbjEMJZM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 13 May 2023 05:25:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CBFE40FB;
        Sat, 13 May 2023 02:25:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1aaea43def7so75178055ad.2;
        Sat, 13 May 2023 02:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683969911; x=1686561911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlCH0G2m8kRJpvkxVEbC2XIL/mZruz0Jkv7EOy6aMxk=;
        b=fhQmRZtAHOH36wyJU2rlLs/w4OhknwgCOTsAGH2bgx5fytY08pzzIFphrFGUASWOq4
         OJdOATuTGchZKM4Uo+PM0gi4v5ssEvxQhbP9KKE13C8v98wtMD+0EMeZmXHJisssn9sc
         7wGGpl0vvH/oFaYAgkHUwbLvVLaE0veCNt8KAH1NSlY0Ed94HnOpf02KjqHMKTPNVWsf
         lMUUQdgfMZhaDM5dvZ4gH8K/KW3Wyksje5KN4bUk6rttnH8+qeZslb3Bvhz7270CMq2l
         WdoKImJ+rRYO0op8mHBawLeEcMBCh9GypjQC/Wdr3VxZSQh9TBvdN/qnGyyB1EcUBmob
         2ZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683969911; x=1686561911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlCH0G2m8kRJpvkxVEbC2XIL/mZruz0Jkv7EOy6aMxk=;
        b=g228uvaO4KlmzKLuE+CgCyUcJdPdUXJ/dlnVzinhJqjrwlG9/HsEhM65oqmR4OJMrK
         195b0u7NokxwWWtmyLAPGc6YdXCBQHBARHAcUCvl2B3D6f1JgwKmdi7yBL2dOG8luT2a
         gkkZPDH2Z7TqlK8409QlP+me3gHBH41o4BYoL3voGei2UiK1jTzgdblE0Bx9JYDKlZt5
         BkoaZh/T0NyGAFIKzP089aFyyuEyk4IKSisAX8R6RomU+kiI9bJd716Lipbxgs4zQnc1
         t55ntGEa4+Gv6/2Tv1TRwkKxIq0JqTjx6bT9TCimLVHws3hS2Zcc3zajN+Dc77EX9Lwi
         If0A==
X-Gm-Message-State: AC+VfDw/SaT3vcnPX1VweePkOqmkTNV6EfAJe0TiCCoXRF8igwBs7ijl
        R76CRu2TmwUki2h67xXSuuw=
X-Google-Smtp-Source: ACHHUZ7LknF76h0kIjVXmGlmqNXZ+WVcST0A5b/F7jca+bKv9M+VoFiYWPkLa51Ng/PS0qu7yYpFQg==
X-Received: by 2002:a17:903:338e:b0:1a9:8ba4:d0d3 with SMTP id kb14-20020a170903338e00b001a98ba4d0d3mr24277429plb.8.1683969911004;
        Sat, 13 May 2023 02:25:11 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-69.three.co.id. [180.214.232.69])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902728d00b001a217a7a11csm6335741pll.131.2023.05.13.02.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:25:10 -0700 (PDT)
Message-ID: <e53ccc96-49f5-6e01-6edf-d44b1cff405f@gmail.com>
Date:   Sat, 13 May 2023 16:25:01 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 00/10] Treewide GPL SPDX conversion and cleanup (in
 response to Didi's GPL full name fixes)
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Networking <netdev@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Staging Drivers <linux-staging@lists.linux.dev>,
        Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
        Linux Kernel Actions <linux-actions@lists.infradead.org>,
        Diederik de Haas <didi.debian@cknow.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Airlie <airlied@redhat.com>,
        Karsten Keil <isdn@linux-pingi.de>,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Sam Creasey <sammy@sammy.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Jan Kara <jack@suse.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <2023051243-bunch-goliath-7380@gregkh>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2023051243-bunch-goliath-7380@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/12/23 18:23, Greg Kroah-Hartman wrote:
> I'm glad to take these types of changes through the SPDX tree, but
> please break them up into smaller changes that show the justification
> for each type of change in each subsystem, so that we can evaluate them
> on an individual basis.  As you did here, you are lumping things
> together only by the existance of the file in the tree, not by the
> logical type of change happening, which isn't ok.
> 
> Also, you can send them as subsystem-specific series, so as to not have
> to cross-post all of the changes all over the place.  I doubt the drm
> developers care about ethernet driver license issues :)
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

