Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEB525DDDE
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Sep 2020 17:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgIDPgE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Sep 2020 11:36:04 -0400
Received: from foss.arm.com ([217.140.110.172]:52800 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726898AbgIDPgD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Sep 2020 11:36:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 584A8113E;
        Fri,  4 Sep 2020 08:36:01 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05A223F66F;
        Fri,  4 Sep 2020 08:35:58 -0700 (PDT)
Subject: Re: [PATCH 00/10] dt-bindings: Convert SP805 to Json-schema (and fix
 users)
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Viresh Kumar <vireshk@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chanho Min <chanho.min@lge.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>
References: <20200828130602.42203-1-andre.przywara@arm.com>
 <19c6a67e-48f0-c0b6-3653-32a5a1f09e07@gmail.com>
 <CACRpkdbMbNd87145iwdL7=x501cvgU7wiZXNLF456sn6WvoodQ@mail.gmail.com>
 <302c54fd-5183-c8d0-7038-f6e60c7bb056@gmail.com>
From:   =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <26416b9b-d390-d7df-ee1f-8ec7ca08ba72@arm.com>
Date:   Fri, 4 Sep 2020 16:35:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <302c54fd-5183-c8d0-7038-f6e60c7bb056@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 04/09/2020 16:29, Florian Fainelli wrote:

Hi,

> On 9/4/2020 1:58 AM, Linus Walleij wrote:>> On Fri, Aug 28, 2020 at 9:34 PM Florian Fainelli
>> <f.fainelli@gmail.com> wrote:
>>> On 8/28/20 6:05 AM, Andre Przywara wrote:
>>
>>> What is the plan for merging this series? Should Rob pick up all changes
>>> or since those are non critical changes, should we just leave it to the
>>> SoC maintainers to pick up the changes in their tree?
>>
>> What about André just send a pull request to the ARM SoC maintainers
>> for the whole thing?
> 
> I already applied some of the patches, if we got that route please CC me
> so I can drop them from my local queue. Thanks

I would for sure drop these from any PR.

Rob, are you happy with the actual binding conversion? If you are
willing to take it as it is (Viresh has already acked), I could then
split off the DT fixes and either chase the maintainers or send ARM SoC
a PR. But this really depends on the binding being good.

Cheers,
Andre.
