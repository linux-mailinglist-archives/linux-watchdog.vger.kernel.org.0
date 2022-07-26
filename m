Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE76580904
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Jul 2022 03:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237128AbiGZBbX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Jul 2022 21:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiGZBbW (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Jul 2022 21:31:22 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7AC2611E;
        Mon, 25 Jul 2022 18:31:20 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t22so14181238lfg.1;
        Mon, 25 Jul 2022 18:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1zjMXNQOLjWcDy+k9ctEQL0foXM1RR7LLaAi4daajY=;
        b=kYqF92Qu06cjGb4YPrzBNcyM2NUjxgCW16kGdr8I+fnA05c8wgd+ltzaJ99vfsrUob
         7qNC+bNgmgvHSjLRgzixxGh/INhJ0f++4eWh5rjfvid9PeN3g5fGysiIXUgLSbmDNrw3
         N7lfVaxVzxiWxmKuTgabBiUJU5yZke0GP/6h/7AgQ3ZkrT9pvCkeOj9M8nfK0ab8hIUK
         DkTDTyEN+JN9SS+XpnuB4/JEHUxekmvZMYZ+2BrJT/0ONEGC88uxGbcgr7OgDK77Pk7n
         qTJV52LKp47D4jakZQ1rzMMt2GK7R4rtFwD3obcl058HjrMsbN0SAgWl+6gpFzNjObhh
         2q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1zjMXNQOLjWcDy+k9ctEQL0foXM1RR7LLaAi4daajY=;
        b=pmcg1JvZCeqC/Igail03wQxUqe+AEQ4igghF7OlaHTB0ccH4lMHGfiAQ+kK5cp+Xnt
         ZvBysy7CWmdt6Y5kXrOR+cDMTxa2Ukzbw5Do1kkm3NXuG3oNGNww0iFt+BhSt28At5OF
         L6BgCYA3s8be4WW6t1LT67UIS/E4csdeG4T4uHNkUFlr+0xVi/Gv5df/vPhXIecXeO7E
         85Vkj/DMxeP1vJSZP32uo/uibzkH6niv3Y4R7bWCQIeQBzc9rGUChmZ2zCmwIo0yTJXG
         zt/s737H4JEDQE1X5Xsc2J7ECZGFpkkYbgjaEmOJDsIlyRbuqYeEvBZy/V8UWkaLaqgG
         swXA==
X-Gm-Message-State: AJIora/RUVLVVWEW5IX4wYtmREIYygKMcxlxU25bwMmYhZwm7mCWoWpi
        8eKKnm2UKVSy0q4dvvsUL92gFCdPS/u+r1eeN54=
X-Google-Smtp-Source: AGRyM1tCVnoLdGbaKUINoMiM3djVOfeq0chBKHqp9L5vOFxQUBCrgVR8NZwKHm1V5cUwizNE0xh83AJDsBJcBSV+xtU=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr5818171lfr.647.1658799078975; Mon, 25
 Jul 2022 18:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220725030605.1808710-1-klimov.linux@gmail.com> <573466e4-e836-d053-d1b9-dc04c6a046e5@roeck-us.net>
In-Reply-To: <573466e4-e836-d053-d1b9-dc04c6a046e5@roeck-us.net>
From:   Alexey Klimov <klimov.linux@gmail.com>
Date:   Tue, 26 Jul 2022 02:31:07 +0100
Message-ID: <CALW4P+JjO5zxEP4aLGzzcvK2QO0Ea_uYACjuOV6GZEMfh3Q5RA@mail.gmail.com>
Subject: Re: [PATCH v5] watchdog: add driver for StreamLabs USB watchdog device
To:     Guenter Roeck <linux@roeck-us.net>,
        Oliver Neukum <oneukum@suse.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        atishp@rivosinc.com, atishp@atishpatra.org,
        Yury Norov <yury.norov@gmail.com>,
        Alexey Klimov <aklimov@redhat.com>,
        Aaron Tomlin <atomlin@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 25, 2022 at 3:02 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/24/22 20:06, Alexey Klimov wrote:

[...]

> > + * one buffer is used for communication, however transmitted message is only
> > + * 32 bytes long
> > + */
> > +#define BUFFER_TRANSFER_LENGTH       32
> > +#define BUFFER_LENGTH                64
> > +#define USB_TIMEOUT          350
> > +
> Comment about the unit (ms) might be useful.

Yes. I'll add it.

> > +#define STREAMLABS_CMD_START 0xaacc
> > +#define STREAMLABS_CMD_STOP  0xbbff
> > +
> > +/* timeout values are taken from windows program */
> > +#define STREAMLABS_WDT_MIN_TIMEOUT   1
> > +#define STREAMLABS_WDT_MAX_TIMEOUT   46
> > +
> > +struct streamlabs_wdt {
> > +     struct watchdog_device wdt_dev;
> > +     struct usb_interface *intf;
> > +     /* Serialises usb communication with a device */
> > +     struct mutex lock;
> > +     __le16 *buffer;
> > +};
> > +
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> > +                     __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +/* USB call wrappers to send and receive messages to/from the device. */
> > +static int usb_streamlabs_send_msg(struct usb_device *usbdev, __le16 *buf)
> > +{
> > +     int retval;
> > +     int size;
> > +
> > +     retval = usb_interrupt_msg(usbdev, usb_sndintpipe(usbdev, 0x02),
> > +                                buf, BUFFER_TRANSFER_LENGTH,
> > +                                &size, USB_TIMEOUT);
> > +
> > +     if (size != BUFFER_TRANSFER_LENGTH)
> > +             return -EIO;
> > +
>
> If usb_interrupt_msg() returns an error, it will likely not set size,
> which may result in a random -EIO. I think this should be something like
>
>         if (retval)
>                 return retval;
>         if (size != BUFFER_TRANSFER_LENGTH)
>                 return -EIO;
>
>         return 0;

Good point. I'll change it.


> > +     return retval;
> > +}
> > +
> > +static int usb_streamlabs_get_msg(struct usb_device *usbdev, __le16 *buf)
> > +{
> > +     int retval;
> > +     int size;
> > +
> > +     retval = usb_interrupt_msg(usbdev, usb_rcvintpipe(usbdev, 0x81),
> > +                                buf, BUFFER_LENGTH,
> > +                                &size, USB_TIMEOUT);
> > +
> > +     if (size != BUFFER_LENGTH)
> > +             return -EIO;
> > +
> Same here.
>
> > +     return retval;
> > +}
> > +
> > +/*
> > + * This function is used to check if watchdog timeout in the received buffer
> > + * matches the timeout passed from watchdog subsystem.
> > + */
> > +static int usb_streamlabs_wdt_check_timeout(__le16 *buf, unsigned long timeout)
> > +{
> > +     if (buf[3] != cpu_to_le16(timeout))
> > +             return -EPROTO;
> > +
> > +     return 0;
> > +}
> > +
> > +static int usb_streamlabs_wdt_check_response(u8 *buf)
> > +{
> > +     /*
> > +      * If watchdog device understood the command it will acknowledge
> > +      * with values 1,2,3,4 at indexes 10, 11, 12, 13 in response message
> > +      * when response treated as 8bit message.
> > +      */
> > +     if (buf[10] != 1 || buf[11] != 2 || buf[12] != 3 || buf[13] != 4)
> > +             return -EPROTO;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * This function is used to check if watchdog command in the received buffer
> > + * matches the command passed to the device.
> > + */
> > +static int usb_streamlabs_wdt_check_command(__le16 *buf, u16 cmd)
> > +{
> > +     if (buf[0] != cpu_to_le16(cmd))
> > +             return -EPROTO;
> > +
> > +     return 0;
> > +}
> > +
> > +static int usb_streamlabs_wdt_validate_response(__le16 *buf, u16 cmd,
> > +                                             unsigned long timeout_msec)
> > +{
> > +     int retval;
> > +
> > +     retval = usb_streamlabs_wdt_check_response((u8 *)buf);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval = usb_streamlabs_wdt_check_command(buf, cmd);
> > +     if (retval)
> > +             return retval;
> > +
> > +     retval = usb_streamlabs_wdt_check_timeout(buf, timeout_msec);
> > +     return retval;
>
>         assignment to retval is unnecessary.

Ok.

> > +}
> > +
> > +static void usb_streamlabs_wdt_prepare_buf(__le16 *buf, u16 cmd,
> > +                                        unsigned long timeout_msec)
> > +{
> > +     /*
> > +      * remaining elements expected to be zero everytime during
> > +      * communication
> > +      */
> > +     buf[0] = cpu_to_le16(cmd);
> > +     buf[1] = cpu_to_le16(0x8000);
> > +     buf[3] = cpu_to_le16(timeout_msec);
>
> Not setting buf[2] and buf[4] contradicts the comment above. Maybe
> those offsets are not _expected_ to be set by the device, but that
> is not guaranteed. It may be safer to just use memset() at the
> beginning of the function to clear the buffer.

Sure. I guess it makes sense to zero the buffer before reading the
message from the device too?
Before usb_streamlabs_get_msg(usbdev, wdt->buffer).

> > +     buf[5] = 0x0;
> > +     buf[6] = 0x0;
> > +}
> > +
> > +static int __usb_streamlabs_wdt_cmd(struct streamlabs_wdt *wdt, u16 cmd)
> > +{
> > +     struct usb_device *usbdev;
> > +     unsigned long timeout_msec;
> > +     /* how many times to re-try getting the state of the device */
> > +     unsigned int retry_counter = 10;
> > +     int retval;
> > +
> > +     if (unlikely(!wdt->intf))
> > +             return -ENODEV;
> > +
> > +     usbdev = interface_to_usbdev(wdt->intf);
> > +     timeout_msec = wdt->wdt_dev.timeout * MSEC_PER_SEC;
> > +
> > +     usb_streamlabs_wdt_prepare_buf(wdt->buffer, cmd, timeout_msec);
> > +
> > +     /* send command to watchdog */
> > +     retval = usb_streamlabs_send_msg(usbdev, wdt->buffer);
> > +     if (retval)
> > +             return retval;
> > +
> > +     /*
> > +      * Transition from one state to another in this device
> > +      * doesn't happen immediately, especially stopping the device
> > +      * is not observed on the first reading of the response.
> > +      * Plus to avoid potentially stale response message in the device
> > +      * we keep reading the state of the device until we see:
> > +      * -- that device recognised the sent command;
> > +      * -- the received state (started or stopped) matches the state
> > +      * that was requested;
> > +      * -- the timeout passed matches the timeout value read from
> > +      * the device.
> > +      * Keep retrying 10 times and if watchdog device doesn't respond
> > +      * correctly as expected we bail out and return an error.
> > +      */
> > +     do {
> > +             retval = usb_streamlabs_get_msg(usbdev, wdt->buffer);
> > +             if (retval)
> > +                     break;
> > +
> > +             retval = usb_streamlabs_wdt_validate_response(wdt->buffer, cmd,
> > +                                                           timeout_msec);
> > +     } while (retval && retry_counter--);
> > +
> > +     return retry_counter ? retval : -EIO;
> > +}
> > +
> > +static int usb_streamlabs_wdt_cmd(struct streamlabs_wdt *streamlabs_wdt, u16 cmd)
> > +{
> > +     int retval;
> > +
> > +     mutex_lock(&streamlabs_wdt->lock);
> > +     retval = __usb_streamlabs_wdt_cmd(streamlabs_wdt, cmd);
> > +     mutex_unlock(&streamlabs_wdt->lock);
> > +
> > +     return retval;
> > +}
> > +
> > +static int usb_streamlabs_wdt_start(struct watchdog_device *wdt_dev)
> > +{
> > +     struct streamlabs_wdt *streamlabs_wdt = watchdog_get_drvdata(wdt_dev);
> > +
> > +     return usb_streamlabs_wdt_cmd(streamlabs_wdt, STREAMLABS_CMD_START);
> > +}
> > +
> > +static int usb_streamlabs_wdt_stop(struct watchdog_device *wdt_dev)
> > +{
> > +     struct streamlabs_wdt *streamlabs_wdt = watchdog_get_drvdata(wdt_dev);
> > +
> > +     return usb_streamlabs_wdt_cmd(streamlabs_wdt, STREAMLABS_CMD_STOP);
> > +}
> > +
> > +static const struct watchdog_info streamlabs_wdt_ident = {
> > +     .options        = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
> > +     .identity       = DRIVER_NAME,
> > +};
> > +
> > +static const struct watchdog_ops usb_streamlabs_wdt_ops = {
> > +     .owner  = THIS_MODULE,
> > +     .start  = usb_streamlabs_wdt_start,
> > +     .stop   = usb_streamlabs_wdt_stop,
> > +};
> > +
> > +static int usb_streamlabs_wdt_probe(struct usb_interface *intf,
> > +                                 const struct usb_device_id *id)
> > +{
> > +     struct usb_device *usbdev = interface_to_usbdev(intf);
> > +     struct streamlabs_wdt *streamlabs_wdt;
> > +     int retval;
> > +
> > +     /*
> > +      * USB IDs of this device appear to be weird/unregistered. Hence, do
> > +      * an additional check on product and manufacturer.
> > +      * If there is similar device in the field with same values then
> > +      * there is stop command in probe() below that checks if the device
> > +      * behaves as a watchdog.
> > +      */
> > +     if (!usbdev->product || !usbdev->manufacturer ||
> > +         strncmp(usbdev->product, "USBkit", 6) ||
> > +         strncmp(usbdev->manufacturer, "STREAM LABS", 11))
> > +             return -ENODEV;
> > +
> > +     streamlabs_wdt = devm_kzalloc(&intf->dev, sizeof(struct streamlabs_wdt),
> > +                                   GFP_KERNEL);
> > +     if (!streamlabs_wdt)
> > +             return -ENOMEM;
> > +
> > +     streamlabs_wdt->buffer = devm_kzalloc(&intf->dev, BUFFER_LENGTH,
> > +                                           GFP_KERNEL);
> > +     if (!streamlabs_wdt->buffer)
> > +             return -ENOMEM;
> > +
>
> Nit: buffer could be made part of struct streamlabs_wdt and be tagged with
> ____cacheline_aligned to avoid the double allocation.

It was discussed in the past.
https://lore.kernel.org/linux-watchdog/5714E7D3.4030809@roeck-us.net/
https://lore.kernel.org/linux-watchdog/1460988518.25119.28.camel@suse.com/

The conclusion there was that with separate allocation it is
guaranteed to not share a cacheline with mutex lock.
Do we know for sure that it is safe with ____cacheline_aligned attribute?

Oliver, thoughts?

I see that a lot of drivers use cacheline alignment for buffers, so I
guess that should be okay nowadays and I can change it back to initial
version with cacheline alignment.

> > +     mutex_init(&streamlabs_wdt->lock);
> > +
> > +     streamlabs_wdt->wdt_dev.info = &streamlabs_wdt_ident;
> > +     streamlabs_wdt->wdt_dev.ops = &usb_streamlabs_wdt_ops;
> > +     streamlabs_wdt->wdt_dev.timeout = STREAMLABS_WDT_MAX_TIMEOUT;
> > +     streamlabs_wdt->wdt_dev.max_timeout = STREAMLABS_WDT_MAX_TIMEOUT;
> > +     streamlabs_wdt->wdt_dev.min_timeout = STREAMLABS_WDT_MIN_TIMEOUT;
> > +     streamlabs_wdt->wdt_dev.parent = &intf->dev;
> > +
> > +     streamlabs_wdt->intf = intf;
> > +     usb_set_intfdata(intf, &streamlabs_wdt->wdt_dev);
> > +     watchdog_set_drvdata(&streamlabs_wdt->wdt_dev, streamlabs_wdt);
> > +     watchdog_set_nowayout(&streamlabs_wdt->wdt_dev, nowayout);
> > +
> > +     retval = usb_streamlabs_wdt_stop(&streamlabs_wdt->wdt_dev);
> > +     if (retval)
> > +             return -ENODEV;
> > +
>
> A comment explaining why the watchdog is explicitly stopped when running
> might be useful.

What do you mean by saying "when running"?
Everytime during my testing the initial state is "stopped" on
boot/power on/after reset, so not sure what you mean by saying "when
running".
There is a comment above that explains the stop command but I will
add/change comments that explain things better.
The point of executing "stop" command here is to check that device
being probed behaves like we expect it to. This is a bit paranoid
check since I am a not 100% sure that all devices with such USB ids
are watchdogs -- that's why additional checks for usbdev->product and
usbdev->manufacturer and this stop command that doesn't change the
initial state. In theory, I can remove this stop command at all.

Thank you for the review.

[...]

Best regards,
Alexey
