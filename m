Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BCB54E971
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jun 2022 20:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbiFPSeB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jun 2022 14:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237406AbiFPSeA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jun 2022 14:34:00 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6717515B9
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jun 2022 11:33:58 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-f2a4c51c45so2873886fac.9
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jun 2022 11:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=PyeeCc9uKZgK1Y38/4DN8m9K98LXD1tXe9SgPe+i7+o=;
        b=RrZGLVXohqFXaY1Y76HVxmFI0dlrAV0jxXAtbo/KPTKojSchKqpL+mbCxgMgiPE8A7
         qsCNvKjB/7ZlfJMXYYDX0uOurUA/YYWoBWAN4lUZdjdaJzk7wOCd7e0Y9wxYsvW/bITi
         cOgrGYilDLq+gqfmzlFNnH1c+PyR4WfnRKKC2tvMbDpG6CN58qbgKZ6Eld4qy74ZmK9m
         q7s0UEjAfZNRP0TRgjJ/r9isX7bMjMY0+8wuOpQpA06h2OIszuV1ZfHZWF9S0dP/BeBU
         onMy80oyeElKqfY1KHwJxfqp7sedAYjpljJKptPfAhpOwQ4HoY1m2jlfjrsDCHP0i8hs
         5lgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=PyeeCc9uKZgK1Y38/4DN8m9K98LXD1tXe9SgPe+i7+o=;
        b=vrf9lr7fQ2cxtmBvgAFrcLGj7SsfMDtKbQSFRGJBYH5zS5wmN/ygzMQ6K+vBzg6wV4
         6a5LEk4boNgpXoZx/G9H7Dhx9wlkaHvYc8YHaaDHWd7k3ihsH/ei1da3qCBwvzHaepO7
         pi5Z2s6aeS/rydrtUBas7VKVeNitGDQAAo8BGkn59Kd4SXxqv4QoKSU6i4nganQ1kcFi
         rQXYi4xZHfdKynYUKZHBISBWuA05IGZSliF0j/Q5CWX4TXe97/IxBqLskYnJzThLqRRW
         8E+ID1nc/POtTB7z5lxxxJXRtr3HjJQ8UfX5OoYV+ojxbodrFqb4h/0EBLHRUDD49SNc
         ZtAw==
X-Gm-Message-State: AJIora/TrA6qll0zq8dRTyFK9fiXflyxQ1rLMg4INQbkWlcnNcFMKpnq
        VWlH29ezzS40Ra7vWXJaWg1v4y4J/t4=
X-Google-Smtp-Source: AGRyM1uSklYEnFeILESa8Xqwp8YOimZR0UL9pW2YMHyOijvqPDovPNlu4gINQ917xds+y+djhRy3VQ==
X-Received: by 2002:a05:6870:d698:b0:101:1935:e46c with SMTP id z24-20020a056870d69800b001011935e46cmr3306665oap.154.1655404437951;
        Thu, 16 Jun 2022 11:33:57 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:ccc8:8e07:268b:a09:2834? ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
        by smtp.gmail.com with ESMTPSA id m25-20020a9d6459000000b0060c0b3c1b2asm1153983otl.33.2022.06.16.11.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 11:33:57 -0700 (PDT)
Message-ID: <77db7d29-293a-9a3e-801b-f5001ffa0f1c@gmail.com>
Date:   Thu, 16 Jun 2022 15:33:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/4] pseries-wdt: initial support for H_WATCHDOG-based
 watchdog timers
Content-Language: en-US
From:   Daniel Henrique Barboza <danielhb413@gmail.com>
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
In-Reply-To: <74ac21a1-d56f-50fb-71c2-e800e943f340@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

Update: checking out 'dmesg' more carefully I found out that the module probe
is failing with the following message:

[  186.298424][  T811] pseries-wdt: probe of pseries-wdt.0 failed with error -5

This fail is consistent. If I remove the module and modprobe it again the same
error happens.

The message is being throw by pseries_wdt_probe() (patch 4/4). Back in QEMU, in
Alexey's H_WATCHDOG implementation [1], I see that h_watchdog is returning H_PARAMETER
because the retrieved 'watchdogNumber' is zero.

Also, the pseries_wdt module still appears in 'lsmod' despite this probe error. Not sure
if this is a bug:

[root@fedora ~]# rmmod pseries_wdt
[root@fedora ~]# modprobe pseries_wdt
[ 1792.846769][  T865] pseries-wdt: probe of pseries-wdt.0 failed with error -5
[root@fedora ~]# lsmod | grep pseries
pseries_wdt           262144  0
[root@fedora ~]#


For reference this is all the output of 'lsmod' in the guest:

[root@fedora ~]# lsmod
Module                  Size  Used by
pseries_wdt           262144  0
nfnetlink             262144  1
evdev                 327680  1
input_leds            262144  0
led_class             262144  1 input_leds
fuse                  458752  1
xfs                  1835008  2
libcrc32c             262144  1 xfs
virtio_scsi           327680  2
virtio_pci            262144  0
virtio                327680  2 virtio_scsi,virtio_pci
vmx_crypto            262144  0
gf128mul              262144  1 vmx_crypto
crc32c_vpmsum         327680  1
virtio_ring           327680  3 virtio_scsi,virtio_pci,virtio
virtio_pci_legacy_dev   262144  1 virtio_pci
virtio_pci_modern_dev   262144  1 virtio_pci
autofs4               327680  2


Given that the error is being thrown by Alexey's QEMU code, I'll bring it up in the QEMU
mailing list in [1] and follow it up from there.


[1] https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/


Thanks,


Daniel


On 6/15/22 22:43, Daniel Henrique Barboza wrote:
> Hi,
> 
> I tried this series out with mainline QEMU built with Alexey's patch [1]
> and I wasn't able to get it to work. I'm using a simple QEMU command line
> booting a fedora36 guest in a Power9 boston host:
> 
> sudo  ./qemu-system-ppc64 \
> -M pseries,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off,ic-mode=dual \
> -m 4G -accel kvm -cpu POWER9 -smp 1,maxcpus=1,threads=1,cores=1,sockets=1 \
> -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x2 \
> -drive file=/home/danielhb/fedora36.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2,cache=none \
> -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0,bootindex=2 \
> -device qemu-xhci,id=usb,bus=pci.0,addr=0x4 -nographic -display none
> 
> 
> Guest is running v5.19-rc2 with this series applied. Kernel config consists of
> 'pseries_le_defconfig' plus the following 'watchdog' related changes:
> 
> [root@fedora ~]# cat linux/.config | grep PSERIES_WDT
> CONFIG_PSERIES_WDT=y
> 
> [root@fedora ~]# cat linux/.config | grep -i watchdog
> CONFIG_PPC_WATCHDOG=y
> CONFIG_HAVE_NMI_WATCHDOG=y
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> CONFIG_WATCHDOG_NOWAYOUT=y
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> # CONFIG_WATCHDOG_SYSFS is not set
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> # Watchdog Pretimeout Governors
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> # Watchdog Device Drivers
> # CONFIG_SOFT_WATCHDOG is not set
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_WATCHDOG_RTAS=y
> # PCI-based Watchdog Cards
> # CONFIG_PCIPCWATCHDOG is not set
> # USB-based Watchdog Cards
> # CONFIG_USBPCWATCHDOG is not set
> # CONFIG_WQ_WATCHDOG is not set
> [root@fedora ~]#
> 
> 
> 
> Kernel command line:
> 
> [root@fedora ~]# cat /proc/cmdline
> BOOT_IMAGE=(ieee1275/disk,msdos2)/vmlinuz-5.19.0-rc2-00054-g12ede8ffb103 \
> root=/dev/mapper/fedora_fedora-root ro rd.lvm.lv=fedora_fedora/root \
> pseries-wdt.timeout=60 pseries-wdt.nowayout=1 pseries-wdt.action=2
> 
> 
> With all that, executing
> 
> echo V > /dev/watchdog0
> 
> Does nothing. dmesg is clean and the guest doesn't reboot after the 60 sec
> timeout.  I also tried with PSERIES_WDT being compiled as a module instead
> of built-in. Same results.
> 
> 
> What am I missing?
> 
> 
> [1] https://patchwork.ozlabs.org/project/qemu-ppc/patch/20220608030153.1862335-1-aik@ozlabs.ru/
> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
> On 6/2/22 14:53, Scott Cheloha wrote:
>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
>> adds support for this hypercall to powerpc/pseries kernels and
>> introduces a new watchdog driver, "pseries-wdt", for the virtual
>> timers exposed by the hypercall.
>>
>> This series is preceded by the following:
>>
>> RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
>> RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
>> PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/
>>
>> Changes of note from PATCH v1:
>>
>> - Trim down the large comment documenting the H_WATCHDOG hypercall.
>>    The comment is likely to rot, so remove anything we aren't using
>>    and anything overly obvious.
>>
>> - Remove any preprocessor definitions not actually used in the module
>>    right now.  If we want to use other features offered by the hypercall
>>    we can add them in later.  They're just clutter until then.
>>
>> - Simplify the "action" module parameter.  The value is now an index
>>    into an array of possible timeoutAction values.  This design removes
>>    the need for the custom get/set methods used in PATCH v1.
>>
>>    Now we merely need to check that the "action" value is a valid
>>    index during pseries_wdt_probe().  Easy.
>>
>> - Make the timeoutAction a member of pseries_wdt, "action".  This
>>    eliminates the use of a global variable during pseries_wdt_start().
>>
>> - Use watchdog_init_timeout() idiomatically.  Check its return value
>>    and error out of pseries_wdt_probe() if it fails.
>>
>>
